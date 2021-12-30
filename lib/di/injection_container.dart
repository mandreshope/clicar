import 'package:clicar/app/core/http/http_client.dart';
import 'package:clicar/app/core/usecases/fetch_token_usecase.dart';
import 'package:clicar/app/data/repositories/contract/contract_repository_impl.dart';
import 'package:clicar/app/data/repositories/upload_file/upload_file_repository_impl.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:clicar/app/domain/repositories/upload_file/upload_file_repository.dart';
import 'package:clicar/app/domain/usecases/auth/change_password_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/logout_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/search_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:clicar/app/domain/usecases/user/me_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/register_usecase.dart';
import 'package:clicar/app/domain/usecases/user/user_add_photo_usecase.dart';
import 'package:clicar/app/domain/usecases/user/user_change_password.dart';
import 'package:clicar/app/domain/usecases/user/user_info_update_usecase.dart';
import 'package:clicar/app/presentation/pages/account/bloc/account/account_bloc.dart';
import 'package:clicar/app/presentation/pages/account/bloc/user_info/user_info_bloc.dart';
import 'package:clicar/app/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:clicar/app/presentation/pages/home/bloc/user/user_bloc.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/accept_contract/accept_contract_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:clicar/app/core/network/network_info.dart';
import 'package:clicar/app/data/repositories/auth/auth_repository_impl.dart';
import 'package:clicar/app/data/repositories/user/user_repository_impl.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:clicar/app/data/sources/local/local_source_impl.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/data/sources/remote/remote_source_impl.dart';
import 'package:clicar/app/domain/repositories/auth/auth_repository.dart';
import 'package:clicar/app/domain/repositories/user/user_repository.dart';
import 'package:clicar/app/domain/usecases/auth/login_usecase.dart';

final GetIt sl = GetIt.instance; //sl is referred to as Service Locator

///Dependency injection
Future<void> init() async {
  ///Blocs
  sl.registerFactory(() => AuthBloc(
      logoutUseCase: sl(),
      loginUseCase: sl(),
      fetchTokenUseCase: sl(),
      registerUseCase: sl()));
  sl.registerFactory(() => ForgotPasswordBloc(
      forgotPasswordUseCase: sl(), changePasswordUseCase: sl()));
  sl.registerFactory(() => UserBloc(meUseCase: sl()));
  sl.registerFactory(() => UserInfoBloc(userInfoUpdateUseCase: sl()));
  sl.registerFactory(() => SignatureBloc(
      searchContractUseCase: sl(),
      uploadSingleFileUseCase: sl(),
      signContractUseCase: sl()));
  sl.registerFactory(() => AcceptContractBloc());
  sl.registerFactory(() => AccountBloc(
      uploadSingleFileUseCase: sl(),
      userAddPhotoUseCase: sl(),
      userChangePasswordUseCase: sl()));

  ///Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => FetchTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(repository: sl()));
  sl.registerLazySingleton(() => MeUseCase(repository: sl()));
  sl.registerLazySingleton(() => UserInfoUpdateUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchContractUseCase(repository: sl()));
  sl.registerLazySingleton(() => SignContractUseCase(repository: sl()));
  sl.registerLazySingleton(() => UploadSingleFileUseCase(repository: sl()));
  sl.registerLazySingleton(() => UserAddPhotoUseCase(repository: sl()));
  sl.registerLazySingleton(() => UserChangePasswordUseCase(repository: sl()));

  ///Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
        networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
        networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<ContractRepository>(
    () => ContractRepositoryImpl(
        networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<UploadFileRepository>(
    () => UploadFileRepositoryImpl(
        networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()),
  );

  ///Data sources
  sl.registerLazySingleton<RemoteSource>(() => RemoteSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalSource>(
      () => LocalSourceImpl(sharedPreferences: sl()));

  ///Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton<HttpClient>(() => HttpClient());

  ///External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
}
