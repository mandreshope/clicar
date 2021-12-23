import 'package:clicar/app/presentation/pages/login/login_page.dart';
import 'package:clicar/app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
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

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.login : (BuildContext context)=> LoginPage(),
    AppRoutes.splash : (BuildContext context)=>const SplashPage(),
  };

}