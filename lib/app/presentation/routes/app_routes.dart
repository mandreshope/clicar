import 'package:clicar/app/presentation/pages/account/account_page.dart';
import 'package:clicar/app/presentation/pages/account/user_info_page.dart';
import 'package:clicar/app/presentation/pages/account/user_password_page.dart';
import 'package:clicar/app/presentation/pages/document/document_page.dart';
import 'package:clicar/app/presentation/pages/document/document_photo_page.dart';
import 'package:clicar/app/presentation/pages/document/document_summary_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_billed_info_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_billed_info_summary_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_camera_exterior_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_defects_exterior_note_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_defects_exterior_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_departure_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_fuel_level_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_mileage_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_photo_cle_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_photo_exterior_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_photo_interior_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_photo_list_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_photo_picker_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_signature_confirm_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_signature_detail_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_signature_draw_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_signature_success_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_summary_checklist.dart';
import 'package:clicar/app/presentation/pages/edl/edl_summary_page.dart';
import 'package:clicar/app/presentation/pages/edl/edl_retour_page.dart';
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
import 'package:clicar/app/presentation/pages/signature/signature_pdf_viewer_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_success_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_summary_page.dart';
import 'package:clicar/app/presentation/pages/signature/signature_choice_page.dart';
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
  static const signatureDetail = '/signature-detail';
  static const userChangePassword = '/user-change-password';
  static const edlDeparture = '/edl-departure';
  static const edlSummary = '/edl-summary';
  static const edlRetour = '/edl-retour';
  static const edlPhotoPicker = '/edl-photo-picker';
  static const edlDefectsExterior = '/edl-defects-exterior';
  static const edlFuelLevel = '/edl-fuel-level';
  static const edlMileage = '/edl-mileage';
  static const edlSummaryChecklist = '/edl-summary-checklist';
  static const edlPhotoExterior = '/edl-photo-exterior';
  static const edlPhotoInterior = '/edl-photo-interior';
  static const edlPhotoCle = '/edl-photo-cle';
  static const edlPhotoList = '/edl-photo-list';
  static const edlDefectsExteriorNote = '/edl-defects-exterior-note';
  static const edlSignatureConfim = '/edl-signature-confim';
  static const edlSignatureDraw = '/edl-signature-Draw';
  static const edlSignatureDetail = '/edl-signature-detail';
  static const edlSignatureSuccess = '/edl-signature-success';
  static const edlBilledInfo = '/edl-billed-info';
  static const edlBilledInfoSummary = '/edl-billed-info-summary';
  static const document = '/document';
  static const documentPhoto = '/document-photo';
  static const documentSummary = '/document-summary';
  static const edlCameraExterior = '/edl-camera-exterior';
  static const signaturePdfViewer = '/signature-pdf-Viewer';
  static const signatureChoice = '/signature-choice';


  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.login: (BuildContext context) => LoginPage(),
    AppRoutes.splash: (BuildContext context) => const SplashPage(),
    AppRoutes.home: (BuildContext context) => const HomePage(),
    AppRoutes.account: (BuildContext context) => const AccountPage(),
    AppRoutes.register: (BuildContext context) => RegisterPage(),
    AppRoutes.userInfo: (BuildContext context) => const UserInfoPage(),
    AppRoutes.forgotPassword: (BuildContext context) => ForgotPasswordPage(),
    AppRoutes.changePassword: (BuildContext context) => ChangePasswordPage(),
    AppRoutes.signature: (BuildContext context) => SignaturePage(),
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
    AppRoutes.userChangePassword: (BuildContext context) => UserPasswordPage(),
    AppRoutes.edlDeparture: (BuildContext context) => EdlDeparturePage(),
    AppRoutes.edlRetour: (BuildContext context) => EdlRetourPage(),
    AppRoutes.edlSummary: (BuildContext context) => const EdlSummaryPage(),
    AppRoutes.edlPhotoPicker: (BuildContext context) =>
        const EdlPhotoPickerPage(),
    AppRoutes.edlDefectsExterior: (BuildContext context) =>
        const EdlDefectsExteriorPage(),
    AppRoutes.edlFuelLevel: (BuildContext context) => const EdlFuelLevelPage(),
    AppRoutes.edlMileage: (BuildContext context) => EdlMileagePage(),
    AppRoutes.edlSummaryChecklist: (BuildContext context) =>
        const EdlSummaryChecklistPage(),
    AppRoutes.edlPhotoExterior: (BuildContext context) =>
        const EdlPhotoExteriorPage(),
    AppRoutes.edlPhotoInterior: (BuildContext context) =>
        const EdlPhotoInteriorPage(),
    AppRoutes.edlPhotoCle: (BuildContext context) => EdlPhotoClePage(),
    AppRoutes.edlPhotoList: (BuildContext context) => const EdlPhotoListPage(),
    AppRoutes.edlDefectsExteriorNote: (BuildContext context) =>
        const EdlDefectsExteriorNotePage(),
    AppRoutes.edlSignatureConfim: (BuildContext context) =>
        const EdlSignatureConfimPage(),
    AppRoutes.edlSignatureDraw: (BuildContext context) =>
        EdlSignatureDrawPage(),
    AppRoutes.edlSignatureDetail: (BuildContext context) =>
        const EdlSignatureDetailPage(),
    AppRoutes.edlSignatureSuccess: (BuildContext context) =>
        const EdlSignatureSuccessPage(),
    AppRoutes.edlBilledInfo: (BuildContext context) => EdlBilledInfoPage(),
    AppRoutes.edlBilledInfoSummary: (BuildContext context) =>
        const EdlBilledInfoSummaryPage(),
    AppRoutes.document: (BuildContext context) => const DocumentPage(),
    AppRoutes.documentPhoto: (BuildContext context) =>
        const DocumentPhotoPage(),
    AppRoutes.documentSummary: (BuildContext context) =>
        const DocumentSummaryPage(),
    AppRoutes.edlCameraExterior: (BuildContext context) =>
        const EdlCameraExteriorPage(),
    AppRoutes.signaturePdfViewer: (BuildContext context) =>
        const SignaturePdfViewerPage(),
    AppRoutes.signatureChoice: (BuildContext context) =>
        const SignatureChoicePage(),
  };
}
