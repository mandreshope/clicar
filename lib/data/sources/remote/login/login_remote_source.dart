import 'dart:convert';

import 'package:clicar/core/errors/exceptions.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/data/models/login/login_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteSource {
  Future<LoginModel> login(String email, String password);
}

class LoginRemoteSourceImpl extends LoginRemoteSource {
  late http.Client client;
  LoginRemoteSourceImpl({required this.client});

  @override
  Future<LoginModel> login(String email, String password) async {
    final response = await client.post(Uri.parse("$baseUrl$loginEndPoint"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }));

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
