import 'package:clicar/app/presentation/pages/account/account_page.dart';
import 'package:clicar/app/presentation/pages/account/user_info_page.dart';
import 'package:clicar/app/presentation/pages/forgot_password/change_password_page.dart';
import 'package:clicar/app/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:clicar/app/presentation/pages/home/home_page.dart';
import 'package:clicar/app/presentation/pages/login/login_page.dart';
import 'package:clicar/app/presentation/pages/register/register_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_agreement_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_confirm_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_detail_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_draw_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_success_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_summary_page.dart';
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
  static const signatureSummary = '/signature-summary';
  static const signatureAgreement = '/signature-agreement';
  static const signatureConfirm = '/signature-confirm';
  static const signatureDraw = '/signature-draw';
  static const signatureSuccess = '/signature-success';
  static const signatureDetail = 'signature-detail';

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
    AppRoutes.signatureSummary: (BuildContext context) =>
        const SignatureSummaryPage(),
    AppRoutes.signatureAgreement: (BuildContext context) =>
        const SignatureAgreementPage(),
    AppRoutes.signatureConfirm: (BuildContext context) =>
        const SignatureConfimPage(),
    AppRoutes.signatureDraw: (BuildContext context) => SignatureDrawPage(),
    AppRoutes.signatureSuccess: (BuildContext context) =>
        const SignatureSuccessPage(),
    AppRoutes.signatureDetail: (BuildContext context) =>
        const SignatureDetailPage(),
  };
}
