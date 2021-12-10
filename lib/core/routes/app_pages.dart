import 'package:clicar/presentation/pages/forgot_password/forgot_password.dart';
import 'package:clicar/presentation/pages/home/home_page.dart';
import 'package:clicar/presentation/pages/login/login_page.dart';
import 'package:clicar/presentation/pages/register/register_page.dart';
import 'package:clicar/presentation/pages/splash/splash_page.dart';
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
          builder: (_) => const ForgotPasswordPage(),
          settings: RouteSettings(
            name: Routes.forgotPassword,
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
