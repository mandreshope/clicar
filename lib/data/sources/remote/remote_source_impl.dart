import 'dart:convert';

import 'package:clicar/core/errors/exceptions.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/data/models/auth/forgot_password_model.dart';
import 'package:clicar/data/models/auth/login_model.dart';
import 'package:clicar/data/models/auth/register_model.dart';
import 'package:clicar/data/models/user/user_model.dart';
import 'package:clicar/data/sources/remote/remote_source.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RemoteSourceImpl extends RemoteSource {
  late http.Client client;
  RemoteSourceImpl({required this.client});

  Map<String, dynamic> _parseBody(String body) {
    final data = json.decode(body);
    debugPrint("$logTrace response $data");
    return data;
  }

  @override
  Future<LoginModel> login({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl$loginEndpoint");
    debugPrint('$logTrace $url');
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(message: response.reasonPhrase ?? 'Server Error');
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
    final url = Uri.parse("$baseUrl$registerEndpoint");
    debugPrint('$logTrace $url');
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
      return RegisterModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(message: response.reasonPhrase ?? 'Server Error');
    }
  }

  @override
  Future<ForgotPasswordModel> forgotPassword({required String email}) async {
    final url = Uri.parse("$baseUrl$forgotPasswordEndpoint");
    debugPrint('$logTrace $url');
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      return ForgotPasswordModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(message: response.reasonPhrase ?? 'Server Error');
    }
  }

  @override
  Future<UserModel> changePassword({
    required String email,
    required String code,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl$changePasswordEndpoint");
    debugPrint('$logTrace $url');
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'code': code,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(message: response.reasonPhrase ?? 'Server Error');
    }
  }

  @override
  Future<UserModel> me({required String token}) async {
    final url = Uri.parse("$baseUrl$meEndpoint");
    debugPrint('$logTrace $url');
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(_parseBody(response.body));
    } else {
      throw ServerException(message: response.reasonPhrase ?? 'Server Error');
    }
  }

  @override
  Future<UserModel> userInfoUpdate({
    required String token,
    required String role,
    required bool deleted,
    required String id,
    required String lastName,
    required String firstName,
    required String username,
    required String email,
  }) async {
    final url = Uri.parse("$baseUrl$userInfoUpdateEndpoint");
    debugPrint('$logTrace $url');
    final response = await client.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
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
      throw ServerException(message: response.reasonPhrase ?? 'Server Error');
    }
  }
}
