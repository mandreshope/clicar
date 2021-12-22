import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/di/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClient extends BaseClient {
  @override
  Future<StreamedResponse> send(BaseRequest request) {
    debugPrint(
        "$logTrace ${this.runtimeType} ${request.method} : ${request.url}");

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
      debugPrint("$logTrace token : $token");
      request.headers.putIfAbsent('Authorization', () => "Bearer $token");
    }
    return request.send();
  }
}
