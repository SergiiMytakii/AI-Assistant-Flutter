// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ai_assiatant_flutter/data/data_sources/firebase_data_source_impl.dart'
    as _i258;
import 'package:ai_assiatant_flutter/data/repositories/auth_repository_impl.dart'
    as _i212;
import 'package:ai_assiatant_flutter/data/repositories/docs_repository_impl.dart'
    as _i22;
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_in_use_case.dart'
    as _i517;
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_out_use_case.dart'
    as _i691;
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_up_use_case.dart'
    as _i937;
import 'package:ai_assiatant_flutter/data/use_cases/auth/user_stream_use_case.dart'
    as _i975;
import 'package:ai_assiatant_flutter/domain/data_sources/firebase_data_source.dart'
    as _i1002;
import 'package:ai_assiatant_flutter/domain/repositories/auth_repository.dart'
    as _i530;
import 'package:ai_assiatant_flutter/domain/repositories/docs_repository.dart'
    as _i1009;
import 'package:ai_assiatant_flutter/presentation/bloc/auth/auth_bloc.dart'
    as _i521;
import 'package:ai_assiatant_flutter/presentation/bloc/docs/docs_cubit.dart'
    as _i705;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1002.FirebaseDataSource>(
      () => _i258.FirebaseDataSourceImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i1009.DocsRepository>(
      () => _i22.DocsRepositoryImpl(
          firebaseDataSource: gh<_i1002.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i530.AuthenticationRepository>(
      () => _i212.AuthenticationRepositoryImpl(gh<_i1002.FirebaseDataSource>()),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i975.UserStreamUseCase>(
        () => _i975.UserStreamUseCase(gh<_i530.AuthenticationRepository>()));
    gh.singleton<_i705.DocsCubit>(
        () => _i705.DocsCubit(gh<_i1009.DocsRepository>()));
    gh.factory<_i517.SignInUseCase>(
        () => _i517.SignInUseCase(gh<_i530.AuthenticationRepository>()));
    gh.factory<_i691.SignOutUseCase>(
        () => _i691.SignOutUseCase(gh<_i530.AuthenticationRepository>()));
    gh.factory<_i937.SignUpUseCase>(
        () => _i937.SignUpUseCase(gh<_i530.AuthenticationRepository>()));
    gh.singleton<_i521.AuthenticationBloc>(() => _i521.AuthenticationBloc(
          gh<_i517.SignInUseCase>(),
          gh<_i937.SignUpUseCase>(),
          gh<_i691.SignOutUseCase>(),
          gh<_i975.UserStreamUseCase>(),
        ));
    return this;
  }
}
