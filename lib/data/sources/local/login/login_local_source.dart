import 'dart:convert';

import 'package:clicar/core/errors/exceptions.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/data/models/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalSource {
  Future<LoginModel> getLastToken();
  Future<void> cacheToken(LoginModel loginModel);
}

class LoginLocalSourceImpl extends LoginLocalSource {
  final SharedPreferences sharedPreferences;

  LoginLocalSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheToken(LoginModel loginModel) {
    return sharedPreferences.setString(cachedToken, jsonEncode(loginModel));
  }

  @override
  Future<LoginModel> getLastToken() {
    String? jsonStr = sharedPreferences.getString(cachedToken);
    if (jsonStr == null) {
      throw CacheException();
    }
    return Future.value(LoginModel.fromJson(jsonDecode(jsonStr)));
  }
}
