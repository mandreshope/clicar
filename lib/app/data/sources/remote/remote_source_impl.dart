import 'dart:convert';
import 'dart:io';

import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/http/http_client.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/data/models/auth/forgot_password_model.dart';
import 'package:clicar/app/data/models/auth/login_model.dart';
import 'package:clicar/app/data/models/auth/register_model.dart';
import 'package:clicar/app/data/models/contract/contract_model.dart';
import 'package:clicar/app/data/models/customer/customer_model.dart';
import 'package:clicar/app/data/models/driver/driver_model.dart';
import 'package:clicar/app/data/models/upload_file/upload_file_model.dart';
import 'package:clicar/app/data/models/user/user_model.dart';
import 'package:clicar/app/data/models/vehicle/vehicle_model.dart';
import 'package:clicar/app/data/sources/remote/remote_config.dart';
import 'package:clicar/app/data/sources/remote/remote_source.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:clicar/di/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:clicar/app/core/utils/extension.dart';

class RemoteSourceImpl extends RemoteSource {
  late HttpClient client;
  RemoteSourceImpl({required this.client});

  Map<String, dynamic> _parseBody(String body) {
    final data = json.decode(body);
    debugPrint("$logTrace response $data");
    return data;
  }

  void _refreshToken(Map<String, String> headers) {
    if (headers.containsKey("token")) {
      final token = headers["token"];
      if (token != null) {
        final SharedPreferences sharedPreference = sl();
        sharedPreference.setString(cachedToken, token);
        debugPrint("$logTrace token refreshed");
      }
    }
  }

  @override
  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse(RemoteEndpoint.login);
    final response = await client.post(
      url,
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      return LoginModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<RegisterModel> register({
    required String username,
    required String email,
    required String password,
    required String lastName,
    required String firstName,
    required String role,
  }) async {
    final url = Uri.parse(RemoteEndpoint.register);
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
        'lastName': lastName,
        'firstName': firstName,
        'role': role,
      }),
    );

    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      return RegisterModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: jsonDecode(response.body),
      );
    }
  }

  @override
  Future<ForgotPasswordModel> forgotPassword({required String email}) async {
    final url = Uri.parse(RemoteEndpoint.forgotPassword);
    final response = await client.post(
      url,
      body: jsonEncode({
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      return ForgotPasswordModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<UserModel> changePassword({
    required String email,
    required String code,
    required String password,
  }) async {
    final url = Uri.parse(RemoteEndpoint.changePassword);
    final response = await client.post(
      url,
      body: jsonEncode({
        'email': email,
        'code': code,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      return UserModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<UserModel> me() async {
    final url = Uri.parse(RemoteEndpoint.me);
    final response = await client.get(
      url,
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      return UserModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<UserModel> userInfoUpdate({
    required String role,
    required bool deleted,
    required String id,
    required String lastName,
    required String firstName,
    required String username,
    required String email,
  }) async {
    final url = Uri.parse(RemoteEndpoint.userInfoUpdate);
    final response = await client.patch(
      url,
      body: jsonEncode({
        'role': role,
        'deleted': deleted,
        'id': id,
        'lastName': lastName,
        'firstName': firstName,
        'username': username,
        'email': email,
      }),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);

      ///TODO: REMOVE THIS AND MAKE IT DINAMICALY
      return UserModel.fromJson({
        'role': role,
        'deleted': deleted,
        '_id': id,
        'lastName': lastName,
        'firstName': firstName,
        'username': username,
        'email': email,
      });
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<List<ContractModel>> searchContract({
    required keyWord,
    required bool isSigned,
    bool? hasStartingEdl,
    bool? hasEndingEdl,
  }) async {
    final url = Uri.parse(RemoteEndpoint.searchContract);
    final body = jsonEncode({
      'keyWord': keyWord,
      'isSigned': isSigned,
      'hasStartingEdl': hasStartingEdl,
      'hasEndingEdl': hasEndingEdl,
    }.removeNulls);
    final response = await client.post(url, body: body);
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      Map<String, dynamic> map = _parseBody(response.body);

      try {
        return List.from(map['data'])
            .map((x) => ContractModel.fromJson(x))
            .toList();
      } catch (e) {
        rethrow;
      }
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<UploadFileModel> uploadSingleFile(
      {required File file, required String fileDestination}) async {
    final url = Uri.parse(RemoteEndpoint.uploadSingleFile + fileDestination);

    debugPrint("$url");

    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      final respStr = await response.stream.bytesToString();
      debugPrint(respStr);
      return UploadFileModel.fromJson(json.decode(respStr));
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: '',
      );
    }
  }

  @override
  Future<ContractModel> signContract(
      {required SignContractParams signContractParams}) async {
    final url = Uri.parse(RemoteEndpoint.signContract);
    final response = await client.post(
      url,
      body: jsonEncode(signContractParams.toMap()),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      final body = _parseBody(response.body);

      ///TODO RETURN ALL ID TO OBJECT IN CONTRACT DATA
      /*final contract = body['contract'];*/
      return ContractModel.fromJson({});
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<bool> userAddPhoto({
    required String photo,
    required String id,
  }) async {
    final url = Uri.parse(RemoteEndpoint.userInfoUpdate);
    final response = await client.patch(
      url,
      body: jsonEncode({
        'photo': photo,
        "_id": id,
        "id": id,
      }),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      return true;
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<bool> userChangePassword({
    required String password,
    required String id,
    required String newPassword,
  }) async {
    final url = Uri.parse(RemoteEndpoint.userInfoUpdate);
    final response = await client.patch(
      url,
      body: jsonEncode({
        "_id": id,
        "id": id,
        "password": password,
        "newPassword": newPassword,
      }),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      return true;
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: jsonDecode(response.body),
      );
    }
  }

  @override
  Future<List<UploadFileModel>> uploadMultiFile(
      {required List<File> files, required String fileDestination}) async {
    final url = Uri.parse(RemoteEndpoint.uploadMultiFile + fileDestination);

    debugPrint("$url");

    var request = http.MultipartRequest('POST', url);

    for (var file in files) {
      request.files.add(await http.MultipartFile.fromPath('files', file.path));
    }

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      final respStr = await response.stream.bytesToString();
      debugPrint(respStr);

      Iterable iterable = json.decode(respStr);
      return iterable.map((e) => UploadFileModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: '',
      );
    }
  }

  @override
  Future<ContractModel> edlDeparture(
      {required Map<String, dynamic> data}) async {
    final url = Uri.parse(RemoteEndpoint.edlDeparture);
    final response = await client.post(
      url,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      final body = _parseBody(response.body);

      final contract = body['contract'];
      return ContractModel.fromJson(contract);
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<ContractModel> edlRetour({required Map<String, dynamic> data}) async {
    final url = Uri.parse(RemoteEndpoint.edlRetour);
    final response = await client.post(
      url,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      final body = _parseBody(response.body);

      final contract = body['contract'];
      return ContractModel.fromJson(contract);
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<CustomerModel> customerUpdate(
      {required Map<String, dynamic> data, required String id}) async {
    final url = Uri.parse(RemoteEndpoint.customerUpdate);
    final response = await client.post(
      url,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      try {
        // final body = _parseBody(response.body);

        return CustomerModel.fromJson({}); //TODO: RESPONSE STRING NOT A JSON
      } catch (e) {
        rethrow;
      }
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<DriverModel> driverUpdate(
      {required Map<String, dynamic> data, required String id}) async {
    final url = Uri.parse(RemoteEndpoint.driverEdit);
    final response = await client.patch(
      url,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      try {
        // final body = _parseBody(response.body);

        return DriverModel.fromJson({}); //TODO: RESPONSE STRING NOT A JSON
      } catch (e) {
        rethrow;
      }
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<VehicleModel> vehicleUpdate(
      {required Map<String, dynamic> data, required String id}) async {
    final url = Uri.parse(RemoteEndpoint.vehicleEdit(id));
    final body = jsonEncode(data);
    final response = await client.patch(
      url,
      body: body,
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      try {
        // final body = _parseBody(response.body);

        return VehicleModel.fromJson({}); //TODO: RESPONSE STRING NOT A JSON
      } catch (e) {
        rethrow;
      }
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<List<CustomerModel>> searchCustomer({required String filter}) async {
    final url = Uri.parse(RemoteEndpoint.customerFilter);
    final response = await client.post(
      url,
      body: jsonEncode({
        'filter': filter,
      }),
    );
    if (response.statusCode == 200) {
      try {
        _refreshToken(response.headers);
        final Iterable iterable = jsonDecode(response.body);

        return List.from(iterable)
            .map((x) => CustomerModel.fromJson(x))
            .toList();
      } catch (e) {
        rethrow;
      }
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<List<DriverModel>> searchDriver({required String filter}) async {
    final url = Uri.parse(RemoteEndpoint.driverFilter);
    final response = await client.post(
      url,
      body: jsonEncode({
        'filter': filter,
      }),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      try {
        _refreshToken(response.headers);
        final Iterable iterable = jsonDecode(response.body);

        return List.from(iterable).map((x) => DriverModel.fromJson(x)).toList();
      } catch (e) {
        rethrow;
      }
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }

  @override
  Future<List<VehicleModel>> searchVehicle(
      {required Map<String, dynamic> filters}) async {
    final url = Uri.parse(RemoteEndpoint.vehicleSearch);
    final response = await client.post(
      url,
      body: jsonEncode(filters),
    );
    if (response.statusCode == 200) {
      _refreshToken(response.headers);
      try {
        _refreshToken(response.headers);
        final Iterable iterable = jsonDecode(response.body);

        return List.from(iterable)
            .map((x) => VehicleModel.fromJson(x))
            .toList();
      } catch (e) {
        rethrow;
      }
    } else {
      throw ServerException(
        statusCode: response.statusCode,
        message: response.reasonPhrase ?? 'Server Error',
        body: response.body,
      );
    }
  }
}
