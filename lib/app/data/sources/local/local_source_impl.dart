import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/data/models/auth/login_model.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSourceImpl extends LocalSource {
  final SharedPreferences sharedPreferences;

  LocalSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheToken(String token) {
    return sharedPreferences.setString(cachedToken, token);
  }

  @override
  Future<LoginModel> getLastToken() {
    String? jsonStr = sharedPreferences.getString(cachedToken);
    if (jsonStr == null) {
      throw CacheException();
    }
    return Future.value(LoginModel(token: jsonStr));
  }

  @override
  Future<void> removeToken() {
    return sharedPreferences.remove(cachedToken);
  }
}
