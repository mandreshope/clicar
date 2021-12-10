import 'dart:convert';

import 'package:clicar/core/errors/exceptions.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/data/models/login/login_model.dart';
import 'package:clicar/data/models/user/user_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteSource {
  Future<LoginModel> login(String username, String password);
  Future<UserModel> register(
    String username,
    String email,
    String password,
    String lastName,
    String firstName,
    String role,
  );
}

class RemoteSourceImpl extends RemoteSource {
  late http.Client client;
  RemoteSourceImpl({required this.client});

  @override
  Future<LoginModel> login(String username, String password) async {
    final response = await client.post(
      Uri.parse("$baseUrl$loginEndpoint"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return LoginModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.reasonPhrase ?? 'Server Error');
    }
  }

  @override
  Future<UserModel> register(
    String username,
    String email,
    String password,
    String lastName,
    String firstName,
    String role,
  ) async {
    final response = await client.post(
      Uri.parse("$baseUrl$registerEndpoint"),
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
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: response.reasonPhrase ?? 'Server Error');
    }
  }
}
