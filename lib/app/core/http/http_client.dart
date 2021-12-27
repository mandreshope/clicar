import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient extends BaseClient {
  dynamic upload(String method, Uri url) {
    debugPrint("$logTrace $method : $url\n");
    return http.MultipartRequest(method, url);
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    debugPrint("$logTrace $runtimeType ${request.method} : ${request.url}\n");

    /// interceptor
    request.headers
        .putIfAbsent("content-type", () => "application/json; charset=utf-8");
    if (request.headers.containsKey("content-type")) {
      request.headers
          .update("content-type", (value) => "application/json; charset=utf-8");
    }
    final sharedPreferences = sl<SharedPreferences>();
    String? token = sharedPreferences.getString(cachedToken);
    if (token != null) {
      debugPrint("$logTrace token : $token\n");
      request.headers.putIfAbsent('Authorization', () => "Bearer $token");
    }
    return request.send();
  }
}
