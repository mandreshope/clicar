import 'package:clicar/app/presentation/pages/account/account_page.dart';
import 'package:clicar/app/presentation/pages/account/user_info_page.dart';
import 'package:clicar/app/presentation/pages/forgot_password/change_password_page.dart';
import 'package:clicar/app/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:clicar/app/presentation/pages/home/home_page.dart';
import 'package:clicar/app/presentation/pages/login/login_page.dart';
import 'package:clicar/app/presentation/pages/register/register_page.dart';
import 'package:clicar/app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part './app_routes.dart';

abstract class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: RouteSettings(
            name: Routes.splash,
            arguments: settings.arguments,
          ),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
          settings: RouteSettings(
            name: Routes.login,
            arguments: settings.arguments,
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: RouteSettings(
            name: Routes.home,
            arguments: settings.arguments,
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => RegisterPage(),
          settings: RouteSettings(
            name: Routes.register,
            arguments: settings.arguments,
          ),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordPage(),
          settings: RouteSettings(
            name: Routes.forgotPassword,
            arguments: settings.arguments,
          ),
        );
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (_) => ChangePasswordPage(),
          settings: RouteSettings(
            name: Routes.changePassword,
            arguments: settings.arguments,
          ),
        );
      case Routes.account:
        return MaterialPageRoute(
          builder: (_) => const AccountPage(),
          settings: RouteSettings(
            name: Routes.account,
            arguments: settings.arguments,
          ),
        );
      case Routes.userInfo:
        return MaterialPageRoute(
          builder: (_) => UserInfoPage(),
          settings: RouteSettings(
            name: Routes.userInfo,
            arguments: settings.arguments,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: RouteSettings(
            name: Routes.splash,
            arguments: settings.arguments,
          ),
        );
    }
  }
}
