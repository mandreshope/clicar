import 'package:clicar/app/data/models/auth/login_model.dart';

abstract class LocalSource {
  Future<LoginModel> getLastToken();
  Future<void> cacheToken(String token);
  Future<void> removeToken();
}
