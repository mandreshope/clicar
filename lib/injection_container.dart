import 'package:clicar/core/usecases/fetch_token_usecase.dart';
import 'package:clicar/domain/usecases/auth/change_password_usecase.dart';
import 'package:clicar/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:clicar/domain/usecases/auth/logout_usecase.dart';
import 'package:clicar/domain/usecases/auth/me_usecase.dart';
import 'package:clicar/domain/usecases/auth/register_usecase.dart';
import 'package:clicar/domain/usecases/user/user_info_update_usecase.dart';
import 'package:clicar/presentation/pages/account/bloc/user_info/user_info_bloc.dart';
import 'package:clicar/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:clicar/presentation/pages/home/bloc/user_bloc.dart';
import 'package:clicar/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'data/repositories/auth/auth_repository_impl.dart';
import 'data/repositories/user/user_repository_impl.dart';
import 'data/sources/local/local_source.dart';
import 'data/sources/local/local_source_impl.dart';
import 'data/sources/remote/remote_source.dart';
import 'data/sources/remote/remote_source_impl.dart';
import 'domain/repositories/auth/auth_repository.dart';
import 'domain/repositories/user/user_repository.dart';
import 'domain/usecases/auth/login_usecase.dart';

final GetIt sl = GetIt.instance; //sl is referred to as Service Locator

///Dependency injection
Future<void> init() async {
  ///Blocs
  sl.registerFactory(() => AuthBloc(
        logoutUseCase: sl(),
        loginUseCase: sl(),
        fetchTokenUseCase: sl(),
        registerUseCase: sl(),
      )..add(UserCheckLoginStatusEvent()));
  sl.registerFactory(
    () => ForgotPasswordBloc(
      forgotPasswordUseCase: sl(),
      changePasswordUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => UserBloc(meUseCase: sl()),
  );
  sl.registerFactory(
    () => UserInfoBloc(userInfoUpdateUseCase: sl()),
  );

  ///Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => MeUseCase(repository: sl()));
  sl.registerLazySingleton(() => UserInfoUpdateUseCase(repository: sl()));

  ///Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  ///Data sources
  sl.registerLazySingleton<RemoteSource>(
    () => RemoteSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<LocalSource>(
    () => LocalSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  ///Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(),
  );

  ///External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
