import 'package:clicar/app/core/http/http_client.dart';
import 'package:clicar/app/core/usecases/fetch_token_usecase.dart';
import 'package:clicar/app/data/repositories/bdc/bdc_repository_impl.dart';
import 'package:clicar/app/data/repositories/contract/contract_repository_impl.dart';
import 'package:clicar/app/data/repositories/contravention/contravention_repository_impl.dart';
import 'package:clicar/app/data/repositories/customer/customer_repository_impl.dart';
import 'package:clicar/app/data/repositories/driver/driver_repository_impl.dart';
import 'package:clicar/app/data/repositories/edl/edl_repository_impl.dart';
import 'package:clicar/app/data/repositories/reservation/reservation_repository_impl.dart';
import 'package:clicar/app/data/repositories/statistique/statistique_repository_impl.dart';
import 'package:clicar/app/data/repositories/upload_file/upload_file_repository_impl.dart';
import 'package:clicar/app/data/repositories/vehicle/vehicle_repository.dart';
import 'package:clicar/app/domain/repositories/bdc/bdc_repository.dart';
import 'package:clicar/app/domain/repositories/contract/contract_repository.dart';
import 'package:clicar/app/domain/repositories/contravention/contravention_repository.dart';
import 'package:clicar/app/domain/repositories/customer/customer_repository.dart';
import 'package:clicar/app/domain/repositories/driver/driver_repository.dart';
import 'package:clicar/app/domain/repositories/edl/edl_repository.dart';
import 'package:clicar/app/domain/repositories/reservation/reservation_repository.dart';
import 'package:clicar/app/domain/repositories/statistique/statistique_repository.dart';
import 'package:clicar/app/domain/repositories/upload_file/upload_file_repository.dart';
import 'package:clicar/app/domain/repositories/vehicle/vehicle_repository.dart';
import 'package:clicar/app/domain/usecases/auth/change_password_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/logout_usecase.dart';
import 'package:clicar/app/domain/usecases/bdc/get_pdf_bdc_usecase.dart';
import 'package:clicar/app/domain/usecases/bdc/search_bdc_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/download_file_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/get_pdf_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/search_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/contravention/search_contravention_usecase.dart';
import 'package:clicar/app/domain/usecases/customer/customer_update_usecase.dart';
import 'package:clicar/app/domain/usecases/customer/search_customer_usecase.dart';
import 'package:clicar/app/domain/usecases/driver/driver_update_usecase.dart';
import 'package:clicar/app/domain/usecases/driver/search_driver_usecase.dart';
import 'package:clicar/app/domain/usecases/edl/edl_departure_usecase.dart';
import 'package:clicar/app/domain/usecases/edl/edl_retour_usecase.dart';
import 'package:clicar/app/domain/usecases/reservation/get_pdf_reservation_usecase.dart';
import 'package:clicar/app/domain/usecases/reservation/search_reservation_usecase.dart';
import 'package:clicar/app/domain/usecases/reservation/sign_reservation_usecase.dart';
import 'package:clicar/app/domain/usecases/statistique/get_stat_encaissement_usecase.dart';
import 'package:clicar/app/domain/usecases/statistique/get_stat_flotte_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_multi_file_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:clicar/app/domain/usecases/user/me_usecase.dart';
import 'package:clicar/app/domain/usecases/auth/register_usecase.dart';
import 'package:clicar/app/domain/usecases/user/user_add_photo_usecase.dart';
import 'package:clicar/app/domain/usecases/user/user_change_password.dart';
import 'package:clicar/app/domain/usecases/user/user_info_update_usecase.dart';
import 'package:clicar/app/domain/usecases/vehicle/search_vehicle_usecase.dart';
import 'package:clicar/app/domain/usecases/vehicle/vehicle_update_usecase.dart';
import 'package:clicar/app/presentation/pages/account/bloc/account/account_bloc.dart';
import 'package:clicar/app/presentation/pages/account/bloc/user_info/user_info_bloc.dart';
import 'package:clicar/app/presentation/pages/document/bloc/document_bloc.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/app/presentation/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:clicar/app/presentation/pages/home/bloc/user/user_bloc.dart';
import 'package:clicar/app/presentation/pages/login/bloc/auth_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/accept_contract/accept_contract_bloc.dart';
import 'package:clicar/app/presentation/pages/signature/bloc/signature_bloc.dart';
import 'package:clicar/app/presentation/pages/statistique/bloc/stat_bloc.dart';
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
  sl.registerFactory(
    () => StatBloc(
      getStatFlotteUseCase: sl(),
      getStatEncaissementUseCase: sl(),
    ),
  );
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
        getPdfContractUsecase: sl(),
        searchContractUseCase: sl(),
        uploadSingleFileUseCase: sl(),
        uploadMultiFileUseCase: sl(),
        signContractUseCase: sl(),
        downloadFileUsecase: sl(),
        searchReservationUseCase: sl(),
        getPdfReservationUsecase: sl(),
        searchBdcUseCase: sl(),
        getPdfBdcUsecase: sl(),
        signReservationUseCase: sl(),
      ));
  sl.registerFactory(() => AcceptContractBloc());
  sl.registerFactory(() => AccountBloc(
      uploadSingleFileUseCase: sl(),
      userAddPhotoUseCase: sl(),
      userChangePasswordUseCase: sl()));
  sl.registerFactory(() => EdlBloc(
      searchContractUseCase: sl(),
      uploadSingleFileUseCase: sl(),
      signContractUseCase: sl(),
      uploadMultiFileUseCase: sl(),
      edlDepartureUseCase: sl(),
      edlRetourUseCase: sl()));
  sl.registerFactory(
    () => DocumentBloc(
      uploadSingleFileUseCase: sl(),
      uploadMultiFileUseCase: sl(),
      searchCustomerUseCase: sl(),
      searchDriverUseCase: sl(),
      searchVehicleUseCase: sl(),
      driverUpdateUseCase: sl(),
      customerUpdateUseCase: sl(),
      vehicleUpdateUseCase: sl(),
      searchContraventionUseCase: sl(),
    ),
  );

  ///Use cases
  sl.registerLazySingleton(() => GetStatFlotteUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetStatEncaissementUseCase(repository: sl()));
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
  sl.registerLazySingleton(() => UploadMultiFileUseCase(repository: sl()));
  sl.registerLazySingleton(() => EdlDepartureUseCase(repository: sl()));
  sl.registerLazySingleton(() => EdlRetourUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchDriverUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchCustomerUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchVehicleUseCase(repository: sl()));
  sl.registerLazySingleton(() => DriverUpdateUseCase(repository: sl()));
  sl.registerLazySingleton(() => VehicleUpdateUseCase(repository: sl()));
  sl.registerLazySingleton(() => CustomerUpdateUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPdfContractUsecase(repository: sl()));
  sl.registerLazySingleton(() => DownloadFileUsecase(repository: sl()));
  sl.registerLazySingleton(() => SearchContraventionUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchReservationUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPdfReservationUsecase(repository: sl()));
  sl.registerLazySingleton(() => SearchBdcUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPdfBdcUsecase(repository: sl()));
  sl.registerLazySingleton(() => SignReservationUseCase(repository: sl()));

  ///Repositories
  sl.registerLazySingleton<StatistiqueRepository>(
    () => StatistiqueRepositoryImpl(
        networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()),
  );
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
  sl.registerLazySingleton<EdlRepository>(
    () => EdlRepositoryImpl(
        networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton<CustomerRepository>(() => CustomerRepositoryImpl(
      networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<DriverRepository>(() => DriverRepositoryImpl(
      networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<VehicleRepository>(() => VehicleRepositoryImpl(
      networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<ContraventionRepository>(() =>
      ContraventionRepositoryImpl(
          networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<ReservationRepository>(() =>
      ReservationRepositoryImpl(
          networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<BdcRepository>(() => BdcRepositoryImpl(
      networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));

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
