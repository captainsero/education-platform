// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/auth/api/data_sources/auth_remote_data_source_impl.dart'
    as _i405;
import '../../features/auth/data/data_sources/auth_remote_data_source_contract.dart'
    as _i193;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domain/repo/auth_repo_contract.dart' as _i990;
import '../../features/auth/domain/use_cases/auth_state_changes_use_case.dart'
    as _i1031;
import '../../features/auth/domain/use_cases/get_current_user_use_case.dart'
    as _i129;
import '../../features/auth/domain/use_cases/sign_in_use_case.dart' as _i926;
import '../../features/auth/domain/use_cases/sign_out_use_case.dart' as _i131;
import '../../features/auth/presentation/view_model/auth_cubit.dart' as _i208;
import '../../features/groups/api/data_sources/groups_remote_data_source_impl.dart'
    as _i347;
import '../../features/groups/data/data_sources/groups_remote_data_source_contract.dart'
    as _i82;
import '../../features/groups/data/repo/groups_repo_impl.dart' as _i668;
import '../../features/groups/domain/repo/groups_repo_contract.dart' as _i405;
import '../../features/groups/domain/use_cases/create_group_with_schedule_use_case.dart'
    as _i943;
import '../../features/groups/domain/use_cases/get_groups_use_case.dart'
    as _i946;
import '../../features/groups/presentation/view_model/groups_cubit.dart'
    as _i1052;
import '../services/launcher_service/launcher_service.dart' as _i293;
import '../services/launcher_service/launcher_service_impl.dart' as _i316;
import '../services/secure_storage/secure_storage_service.dart' as _i349;
import '../supabase/supabase_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final supabaseModule = _$SupabaseModule();
    gh.singleton<_i349.SecureStorageService>(
      () => _i349.SecureStorageService(),
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.supabaseClient);
    gh.factory<_i82.GroupsRemoteDataSourceContract>(
      () => _i347.GroupsRemoteDataSourceImpl(
        supabaseClient: gh<_i454.SupabaseClient>(),
      ),
    );
    gh.factory<_i293.LauncherService>(() => _i316.LauncherServiceImpl());
    gh.factory<_i193.AuthRemoteDataSourceContract>(
      () => _i405.AuthRemoteDataSourceImpl(
        supabaseClient: gh<_i454.SupabaseClient>(),
      ),
    );
    gh.factory<_i990.AuthRepoContract>(
      () => _i984.AuthRepoImpl(
        dataSourceContract: gh<_i193.AuthRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i405.GroupsRepoContract>(
      () => _i668.GroupsRepoImpl(
        dataSourceContract: gh<_i82.GroupsRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i1031.AuthStateChangesUseCase>(
      () => _i1031.AuthStateChangesUseCase(
        repoContract: gh<_i990.AuthRepoContract>(),
      ),
    );
    gh.factory<_i129.GetCurrentUserUseCase>(
      () => _i129.GetCurrentUserUseCase(
        repoContract: gh<_i990.AuthRepoContract>(),
      ),
    );
    gh.factory<_i926.SignInUseCase>(
      () => _i926.SignInUseCase(repoContract: gh<_i990.AuthRepoContract>()),
    );
    gh.factory<_i131.SignOutUseCase>(
      () => _i131.SignOutUseCase(repoContract: gh<_i990.AuthRepoContract>()),
    );
    gh.factory<_i943.CreateGroupWithScheduleUseCase>(
      () => _i943.CreateGroupWithScheduleUseCase(
        repoContract: gh<_i405.GroupsRepoContract>(),
      ),
    );
    gh.factory<_i946.GetGroupsUseCase>(
      () =>
          _i946.GetGroupsUseCase(repoContract: gh<_i405.GroupsRepoContract>()),
    );
    gh.factory<_i208.AuthCubit>(
      () => _i208.AuthCubit(
        authStateChangesUseCase: gh<_i1031.AuthStateChangesUseCase>(),
        getCurrentUserUseCase: gh<_i129.GetCurrentUserUseCase>(),
        signInUseCase: gh<_i926.SignInUseCase>(),
        signOutUseCase: gh<_i131.SignOutUseCase>(),
      ),
    );
    gh.factory<_i1052.GroupsCubit>(
      () => _i1052.GroupsCubit(
        createGroupWithScheduleUseCase:
            gh<_i943.CreateGroupWithScheduleUseCase>(),
        getGroupsUseCase: gh<_i946.GetGroupsUseCase>(),
      ),
    );
    return this;
  }
}

class _$SupabaseModule extends _i784.SupabaseModule {}
