import 'package:clicar/presentation/pages/forgot_password/forgot_password.dart';
import 'package:clicar/presentation/pages/home/home_page.dart';
import 'package:clicar/presentation/pages/login/login_page.dart';
import 'package:clicar/presentation/pages/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part './app_routes.dart';

abstract class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
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
          builder: (_) => const RegisterPage(),
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
          builder: (_) => const LoginPage(),
          settings: RouteSettings(
            name: Routes.login,
            arguments: settings.arguments,
          ),
        );
    }
  }
}
