import 'package:clicar/core/usecases/fetch_token_usecase.dart';
import 'package:clicar/domain/usecases/register/register_usecase.dart';
import 'package:clicar/presentation/pages/login/bloc/login_bloc.dart';
import 'package:clicar/presentation/pages/register/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'data/repositories/login/login_repository_impl.dart';
import 'data/repositories/register/register_repository_impl.dart';
import 'data/sources/local/local_source.dart';
import 'data/sources/remote/remote_source.dart';
import 'domain/repositories/login/login_repository.dart';
import 'domain/repositories/register/register_repository.dart';
import 'domain/usecases/login/login_usecase.dart';

final GetIt sl = GetIt.instance; //sl is referred to as Service Locator

///Dependency injection
Future<void> init() async {
  ///Blocs
  sl.registerFactory(() => LoginBloc(
        loginUseCase: sl(),
        fetchTokenUseCase: sl(),
      )..add(UserCheckLoginStatusEvent()));
  sl.registerFactory(() => RegisterBloc(
        registerUseCase: sl(),
      ));

  ///Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));

  ///Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
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
