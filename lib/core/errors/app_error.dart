import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/services/secure_storage/secure_storage_service.dart';

sealed class AppError {
  const AppError();

  factory AppError.from(Object? error) {
    if (error is AppError) return error;

    // --- Postgrest (database) errors ---
    if (error is PostgrestException) {
      final code = error.code;

      // Postgres error codes: https://www.postgresql.org/docs/current/errcodes-appendix.html
      switch (code) {
        case '23505': // unique_violation
          return ApiMessageError(
            error.message.isNotEmpty
                ? error.message
                : 'This record already exists.',
          );
        case '23503': // foreign_key_violation
          return ApiMessageError(
            error.message.isNotEmpty
                ? error.message
                : 'Related record not found.',
          );
        case '42501': // insufficient_privilege (RLS denied)
          return const PermissionDenied();
        case 'PGRST116': // no rows found for .single()
          return const NotFoundError();
      }

      // PostgREST HTTP-style status codes surfaced via error.code as a string
      final statusCode = int.tryParse(code ?? '');
      if (statusCode != null && statusCode >= 500) {
        return ServerError(statusCode);
      }

      if (error.message.isNotEmpty) return ApiMessageError(error.message);
      return const UnknownError();
    }

    // --- Auth errors ---
    if (error is AuthException) {
      final statusCode = int.tryParse(error.statusCode ?? '');
      if (statusCode != null && statusCode >= 500) {
        return ServerError(statusCode);
      }
      if (statusCode == 403 ||
          error.message.toLowerCase().contains('permission')) {
        return const PermissionDenied();
      }
      if (error.message.isNotEmpty) return ApiMessageError(error.message);
      return const UnknownError();
    }

    if (error is AuthRetryableFetchException) {
      return const NetworkError();
    }

    // --- Storage (file upload/download) errors ---
    if (error is StorageException) {
      final statusCode = int.tryParse(error.statusCode ?? '');
      if (statusCode == 404) return const NotFoundError();
      if (statusCode != null && statusCode >= 500) {
        return ServerError(statusCode);
      }
      if (error.message.isNotEmpty) return ApiMessageError(error.message);
      return const UnknownError();
    }

    // --- Edge Function errors ---
    if (error is FunctionException) {
      final data = error.details;
      String? apiMessage;

      if (data is Map<String, dynamic>) {
        apiMessage = (data['message'] ?? data['error'])?.toString();
      } else if (data is String && data.isNotEmpty) {
        try {
          final decoded = jsonDecode(data) as Map<String, dynamic>;
          apiMessage = (decoded['message'] ?? decoded['error'])?.toString();
        } on FormatException catch (_) {
          // raw string is not JSON, ignore
        }
      }

      if (apiMessage != null && apiMessage.isNotEmpty) {
        return ApiMessageError(apiMessage);
      }
      if (error.status >= 500) return ServerError(error.status);
      if (error.status == 404) return const NotFoundError();
      return const UnknownError();
    }

    // --- Raw network-level failures (no internet, DNS failure, etc.) ---
    if (error is SocketException) return const NetworkError();

    if (error is TimeoutException) return const RequestTimeoutError();

    if (error is KeyNotFoundException) {
      return LocalStorageError(key: error.key);
    }

    if (error is PlatformException) {
      return const LocalStorageError();
    }

    return const UnknownError();
  }
}

class ConnectionTimeoutError extends AppError {
  const ConnectionTimeoutError();
}

class RequestTimeoutError extends AppError {
  const RequestTimeoutError();
}

class NetworkError extends AppError {
  const NetworkError();
}

class NotFoundError extends AppError {
  const NotFoundError();
}

class ServiceDisabled extends AppError {
  const ServiceDisabled();
}

class PermissionDenied extends AppError {
  const PermissionDenied();
}

class PermissionDeniedForever extends AppError {
  const PermissionDeniedForever();
}

class ServerError extends AppError {
  const ServerError(this.statusCode);

  final int statusCode;
}

class ApiMessageError extends AppError {
  const ApiMessageError(this.message);

  final String message;
}

class UnknownError extends AppError {
  const UnknownError();
}

class LocalStorageError extends AppError {
  const LocalStorageError({this.key});

  final String? key;
}
