import 'package:clicar/app/core/errors/exceptions.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/data/models/auth/login_model.dart';
import 'package:clicar/app/data/sources/local/local_source.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
    /*   return Future.value(const LoginModel(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MTM3MzRhYjY0MTY4YWUzYTk5NWQ5OGMiLCJ1c2VybmFtZSI6ImFkbWluIiwiaWF0IjoxNjM5NjY5Mjc1LCJleHAiOjE2Mzk2ODM2NzV9.FGSPrNLKXvaSmWra570tQAuDLmakdwWaZ7n3pedCirQ"));*/
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

  @override
  bool isExpiredToken() {
    String? token = sharedPreferences.getString(cachedToken);
    if (token == null) {
      return true;
    }
    bool hasExpired = JwtDecoder.isExpired(token);
    return hasExpired;
    // You will get a true / false response
    // true: if the token is already expired
    // false: if the token is not expired
  }
}
