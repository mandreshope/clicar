import 'package:clicar/presentation/blocs/login/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'data/repositories/login/login_repository_impl.dart';
import 'data/sources/local/login/login_local_source.dart';
import 'data/sources/remote/login/login_remote_source.dart';
import 'domain/repositories/login/login_repository.dart';
import 'domain/usecases/login/login_usecase.dart';

final sl = GetIt.instance; //sl is referred to as Service Locator

///Dependency injection
Future<void> init() async {
  ///Blocs
  sl.registerFactory(() => LoginBloc(
        loginUseCase: sl(),
      ));

  ///Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));

  ///Repositories
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      networkInfo: sl(),
      localDataSource: sl(),
      remoteDataSource: sl(),
    ),
  );

  ///Data sources
  sl.registerLazySingleton<LoginRemoteSource>(
    () => LoginRemoteSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<LoginLocalSource>(
    () => LoginLocalSourceImpl(
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
}
