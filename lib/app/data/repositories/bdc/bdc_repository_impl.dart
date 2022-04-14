import 'dart:io';

import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/network/network_info.dart';
import 'package:clicar/app/data/models/upload_file/upload_file_model.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/domain/entities/bdc/bdc.dart';
import 'package:clicar/app/domain/entities/reservation/reservation.dart';
import 'package:clicar/app/domain/repositories/bdc/bdc_repository.dart';
import 'package:clicar/app/domain/repositories/reservation/reservation_repository.dart';
import 'package:dartz/dartz.dart';

class BdcRepositoryImpl implements BdcRepository {
  final RemoteSource remoteDataSource;
  final LocalSource localDataSource;
  final NetworkInfo networkInfo;

  BdcRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Bdc>>> search(
      {required String filter}) async {
    if (await networkInfo.isConnected) {
      if (localDataSource.isExpiredToken() == false) {
        try {
          final remoteData =
              await remoteDataSource.searchBdc(filter: filter);

          return Right(remoteData);
        } on ServerException catch (_) {
          return Left(ServerFailure(
            message: _.message,
            statusCode: _.statusCode,
            body: _.body,
          ));
        } on SocketException catch (_) {
          return Left(ServerFailure(
            message: _.toString(),
            body: '',
            statusCode: 0,
          ));
        } catch (_) {
          return Left(ServerFailure(
            message: _.toString(),
            body: '',
            statusCode: 0,
          ));
        }
      } else {
        return Left(TokenExpiredFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, UploadFileModel>> getPdf(
      {required String bdcId}) async {
      if (await networkInfo.isConnected) {
      if (localDataSource.isExpiredToken() == false) {
        try {
          final remoteData =
              await remoteDataSource.getPdfBdc(bdcId: bdcId);
          return Right(remoteData);
        } on ServerException catch (_) {
          return Left(ServerFailure(
            message: _.message,
            statusCode: _.statusCode,
            body: _.body,
          ));
        } on SocketException catch (_) {
          return Left(ServerFailure(
            message: _.toString(),
            body: '',
            statusCode: 0,
          ));
        } catch (_) {
          return Left(ServerFailure(
            message: _.toString(),
            body: '',
            statusCode: 0,
          ));
        }
      } else {
        return Left(TokenExpiredFailure());
      }
    } else {
      return Left(NoConnectionFailure());
    }
  }
  // @override
  // Future<Either<Failure, UploadFileModel>> getPdf(
  //     {required String reservationId}) async {
  //     print("resrevationId == $reservationId");
  //     if (await networkInfo.isConnected) {
  //     if (localDataSource.isExpiredToken() == false) {
  //       try {
  //         final remoteData =
  //             await remoteDataSource.getPdfReservation(reservationId: reservationId);
  //         return Right(remoteData);
  //       } on ServerException catch (_) {
  //         return Left(ServerFailure(
  //           message: _.message,
  //           statusCode: _.statusCode,
  //           body: _.body,
  //         ));
  //       } on SocketException catch (_) {
  //         return Left(ServerFailure(
  //           message: _.toString(),
  //           body: '',
  //           statusCode: 0,
  //         ));
  //       } catch (_) {
  //         return Left(ServerFailure(
  //           message: _.toString(),
  //           body: '',
  //           statusCode: 0,
  //         ));
  //       }
  //     } else {
  //       return Left(TokenExpiredFailure());
  //     }
  //   } else {
  //     return Left(NoConnectionFailure());
  //   }
  // }
  // @override
  // Future<Either<Failure, Contract>> sign(
  //     {required SignContractParams signContractParams}) async {
  //   if (await networkInfo.isConnected) {
  //     if (localDataSource.isExpiredToken() == false) {
  //       try {
  //         final remoteData = await remoteDataSource.signContract(
  //             signContractParams: signContractParams);
  //         return Right(remoteData);
  //       } on ServerException catch (_) {
  //         return Left(ServerFailure(
  //           message: _.message,
  //           statusCode: _.statusCode,
  //           body: _.body,
  //         ));
  //       } on SocketException catch (_) {
  //         return Left(ServerFailure(
  //           message: _.toString(),
  //           body: '',
  //           statusCode: 0,
  //         ));
  //       } catch (_) {
  //         return Left(ServerFailure(
  //           message: _.toString(),
  //           body: '',
  //           statusCode: 0,
  //         ));
  //       }
  //     } else {
  //       return Left(TokenExpiredFailure());
  //     }
  //   } else {
  //     return Left(NoConnectionFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, UploadFileModel>> getPdf(
  //     {required Contract contract}) async {
  //   if (await networkInfo.isConnected) {
  //     if (localDataSource.isExpiredToken() == false) {
  //       try {
  //         final remoteData =
  //             await remoteDataSource.getPdfContract(contract: contract);
  //         return Right(remoteData);
  //       } on ServerException catch (_) {
  //         return Left(ServerFailure(
  //           message: _.message,
  //           statusCode: _.statusCode,
  //           body: _.body,
  //         ));
  //       } on SocketException catch (_) {
  //         return Left(ServerFailure(
  //           message: _.toString(),
  //           body: '',
  //           statusCode: 0,
  //         ));
  //       } catch (_) {
  //         return Left(ServerFailure(
  //           message: _.toString(),
  //           body: '',
  //           statusCode: 0,
  //         ));
  //       }
  //     } else {
  //       return Left(TokenExpiredFailure());
  //     }
  //   } else {
  //     return Left(NoConnectionFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, File>> downloadFile(
  //     {required String path, required String fileName}) async {
  //   if (await networkInfo.isConnected) {
  //     if (localDataSource.isExpiredToken() == false) {
  //       try {
  //         final remoteData = await remoteDataSource.downloadFile(
  //             path: path, fileName: fileName);
  //         return Right(remoteData);
  //       } on ServerException catch (_) {
  //         return Left(ServerFailure(
  //           message: _.message,
  //           statusCode: _.statusCode,
  //           body: _.body,
  //         ));
  //       } on SocketException catch (_) {
  //         return Left(ServerFailure(
  //           message: _.toString(),
  //           body: '',
  //           statusCode: 0,
  //         ));
  //       } catch (_) {
  //         return Left(ServerFailure(
  //           message: _.toString(),
  //           body: '',
  //           statusCode: 0,
  //         ));
  //       }
  //     } else {
  //       return Left(TokenExpiredFailure());
  //     }
  //   } else {
  //     return Left(NoConnectionFailure());
  //   }
  // }
}
