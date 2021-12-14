import 'dart:convert';

import 'package:clicar/core/errors/exceptions.dart';
import 'package:clicar/core/utils/constants.dart';
import 'package:clicar/data/models/auth/login_model.dart';
import 'package:clicar/data/sources/local/local_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSourceImpl extends LocalSource {
  final SharedPreferences sharedPreferences;

  LocalSourceImpl({required this.sharedPreferences});

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

  @override
  Future<void> removeToken() {
    return sharedPreferences.remove(cachedToken);
  }
}
