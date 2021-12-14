import 'package:clicar/data/models/auth/login_model.dart';

abstract class LocalSource {
  Future<LoginModel> getLastToken();
  Future<void> cacheToken(LoginModel loginModel);
  Future<void> removeToken();
}
