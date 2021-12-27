abstract class RemoteConfig {
  static String baseUrl = "https://api-new.clicar.fr";
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
}
