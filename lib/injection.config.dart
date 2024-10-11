// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ai_assiatant_flutter/data/data_sources/firebase_data_source_impl.dart'
    as _i529;
import 'package:ai_assiatant_flutter/data/repositories/auth_repository_impl.dart'
    as _i1021;
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_in_use_case.dart'
    as _i739;
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_out_use_case.dart'
    as _i313;
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_up_use_case.dart'
    as _i1045;
import 'package:ai_assiatant_flutter/data/use_cases/auth/user_stream_use_case.dart'
    as _i65;
import 'package:ai_assiatant_flutter/domain/data_sources/firebase_data_source.dart'
    as _i287;
import 'package:ai_assiatant_flutter/domain/repositories/auth_repository.dart'
    as _i741;
import 'package:ai_assiatant_flutter/presentation/bloc/bloc/auth_bloc.dart'
    as _i455;

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
    gh.factory<_i741.AuthenticationRepository>(
      () => _i1021.AuthenticationRepositoryImpl(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i287.FirebaseDataSource>(
      () => _i529.DatabaseServiceFirebase(),
      registerFor: {
        _dev,
        _prod,
      },
    );
    gh.factory<_i65.UserStreamUseCase>(
        () => _i65.UserStreamUseCase(gh<_i741.AuthenticationRepository>()));
    gh.factory<_i739.SignInUseCase>(
        () => _i739.SignInUseCase(gh<_i741.AuthenticationRepository>()));
    gh.factory<_i313.SignOutUseCase>(
        () => _i313.SignOutUseCase(gh<_i741.AuthenticationRepository>()));
    gh.factory<_i1045.SignUpUseCase>(
        () => _i1045.SignUpUseCase(gh<_i741.AuthenticationRepository>()));
    gh.singleton<_i455.AuthenticationBloc>(() => _i455.AuthenticationBloc(
          gh<_i739.SignInUseCase>(),
          gh<_i1045.SignUpUseCase>(),
          gh<_i313.SignOutUseCase>(),
          gh<_i65.UserStreamUseCase>(),
        ));
    return this;
  }
}
