import 'package:clicar/app/presentation/pages/account/account_page.dart';
import 'package:clicar/app/presentation/pages/account/user_info_page.dart';
import 'package:clicar/app/presentation/pages/forgot_password/change_password_page.dart';
import 'package:clicar/app/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:clicar/app/presentation/pages/home/home_page.dart';
import 'package:clicar/app/presentation/pages/login/login_page.dart';
import 'package:clicar/app/presentation/pages/register/register_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_page.dart';
import 'package:clicar/app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';

abstract class AppRoutes {
  static const initial = '/';
  static const splash = '/splash';
  static const home = '/home';
  static const notFound = '/notFound';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';
  static const changePassword = '/change-password';
  static const account = '/account';
  static const userInfo = '/user-info';
  static const signature = '/signature';

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.login: (BuildContext context) => LoginPage(),
    AppRoutes.splash: (BuildContext context) => const SplashPage(),
    AppRoutes.home: (BuildContext context) => const HomePage(),
    AppRoutes.account: (BuildContext context) => const AccountPage(),
    AppRoutes.register: (BuildContext context) => RegisterPage(),
    AppRoutes.userInfo: (BuildContext context) => const UserInfoPage(),
    AppRoutes.forgotPassword: (BuildContext context) => ForgotPasswordPage(),
    AppRoutes.changePassword: (BuildContext context) => ChangePasswordPage(),
    AppRoutes.signature: (BuildContext context) => const SignaturePage(),
  };
}
