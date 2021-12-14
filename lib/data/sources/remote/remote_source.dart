import 'package:clicar/data/models/auth/forgot_password_model.dart';
import 'package:clicar/data/models/auth/login_model.dart';
import 'package:clicar/data/models/auth/register_model.dart';
import 'package:clicar/data/models/user/user_model.dart';

abstract class RemoteSource {
  Future<LoginModel> login({
    required String username,
    required String password,
  });
  Future<RegisterModel> register({
    required String username,
    required String email,
    required String password,
    required String lastName,
    required String firstName,
    required String role,
  });
  Future<ForgotPasswordModel> forgotPassword({
    required String email,
  });
  Future<UserModel> changePassword({
    required String email,
    required String code,
    required String password,
  });
  Future<UserModel> me({
    required String token,
  });
  Future<UserModel> userInfoUpdate({
    required String token,
    required String role,
    required bool deleted,
    required String id,
    required String lastName,
    required String firstName,
    required String username,
    required String email,
  });
}
