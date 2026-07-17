import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  SupabaseConfig._();

  static String get url => dotenv.env['SUPABASE_URL'] ?? '';
  static String get publishableKey =>
      dotenv.env['SUPABASE_PUBLISHABLE_KEY'] ?? '';

  static Future<void> initialize() async {
    await dotenv.load();

    assert(url.isNotEmpty, 'SUPABASE_URL is not set in .env');
    assert(
      publishableKey.isNotEmpty,
      'SUPABASE_PUBLISHABLE_KEY is not set in .env',
    );

    await Supabase.initialize(
      url: url,
      publishableKey: publishableKey,
    );
  }
}
