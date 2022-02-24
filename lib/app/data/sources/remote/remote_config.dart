abstract class RemoteConfig {
  // static String baseUrl = "https://api-new.clicar.fr";
  static String baseUrl = "https://preprod-api.clicar.fr";
}

abstract class RemoteEndpoint {
  static String login = RemoteConfig.baseUrl + "/auth/login";
  static String register = RemoteConfig.baseUrl + "/user/subscribe";
  static String forgotPassword = RemoteConfig.baseUrl + "/auth/forgotPassword";
  static String changePassword = RemoteConfig.baseUrl + "/auth/changePassword";
  static String me = RemoteConfig.baseUrl + "/user/me";
  static String userInfoUpdate = RemoteConfig.baseUrl + "/user/edit";
  static String searchContract = RemoteConfig.baseUrl + "/contrat/find";
  static String signContract = RemoteConfig.baseUrl + "/contrat/sign";
  static String uploadSingleFile = RemoteConfig.baseUrl + "/uploadFile/upload/";
  static String uploadMultiFile =
      RemoteConfig.baseUrl + "/uploadFile/multiple/";
  static String edlDeparture =
      RemoteConfig.baseUrl + "/contrat/initialCondition";
  static String edlRetour = RemoteConfig.baseUrl + "/contrat/returnCondition";
  static String customerUpdate = RemoteConfig.baseUrl + "/customer/update";
  static String driverEdit = RemoteConfig.baseUrl + "/driver/edit";
  static String vehicleEdit(String id) => RemoteConfig.baseUrl + "/vehicle/$id";
  static String vehicleSearch = RemoteConfig.baseUrl + "/vehicle/search";
  static String driverFilter = RemoteConfig.baseUrl + "/driver/filter";
  static String customerFilter =
      RemoteConfig.baseUrl + "/customer/filterCustomer";
  static String exportToPdfNonRestitution =
      "/exportToPdf/exportToPdfNonRestitution";
}
