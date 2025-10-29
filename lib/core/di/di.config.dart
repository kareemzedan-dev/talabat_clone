// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/remote/login_remote_data_source/login_remote_data_source.dart'
    as _i636;
import '../../features/auth/data/data_sources/remote/register_remote_data_source/register_remote_data_source.dart'
    as _i1039;
import '../../features/auth/data/data_sources_impl/remote/login_remote_data_source_impl/login_remote_data_source_impl.dart'
    as _i926;
import '../../features/auth/data/data_sources_impl/remote/register_remote_data_source_impl/register_remote_data_source_impl.dart'
    as _i364;
import '../../features/auth/data/repos/login_repo_impl/login_repo_impl.dart'
    as _i803;
import '../../features/auth/data/repos/register_repo_impl/register_repo_impl.dart'
    as _i691;
import '../../features/auth/domain/repos/login_repo/login_repo.dart' as _i727;
import '../../features/auth/domain/repos/register_repo/register_repo.dart'
    as _i45;
import '../../features/auth/domain/use_cases/login_use_case/login_use_case.dart'
    as _i1004;
import '../../features/auth/domain/use_cases/register_use_case/register_use_case.dart'
    as _i705;
import '../../features/auth/presentation/view_model/login_view_model/login_view_model.dart'
    as _i64;
import '../../features/auth/presentation/view_model/register_view_model/register_view_model.dart'
    as _i450;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i1039.RegisterRemoteDataSource>(
      () => _i364.RegisterRemoteDataSourceImpl(),
    );
    gh.factory<_i45.RegisterRepo>(
      () => _i691.RegisterRepoImpl(gh<_i1039.RegisterRemoteDataSource>()),
    );
    gh.factory<_i636.LoginRemoteDataSource>(
      () => _i926.LoginRemoteDataSourceImpl(),
    );
    gh.factory<_i727.LoginRepo>(
      () => _i803.LoginRepoImpl(gh<_i636.LoginRemoteDataSource>()),
    );
    gh.factory<_i1004.LoginUseCase>(
      () => _i1004.LoginUseCase(gh<_i727.LoginRepo>()),
    );
    gh.factory<_i64.LoginViewModel>(
      () => _i64.LoginViewModel(gh<_i1004.LoginUseCase>()),
    );
    gh.factory<_i705.RegisterUseCase>(
      () => _i705.RegisterUseCase(gh<_i45.RegisterRepo>()),
    );
    gh.factory<_i450.RegisterViewModel>(
      () => _i450.RegisterViewModel(gh<_i705.RegisterUseCase>()),
    );
    return this;
  }
}
