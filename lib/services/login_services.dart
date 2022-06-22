import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginServices {
  Future fetchGetLogin(
      {required String clientId, required String clientSecret}) async {
    String client_credentials = (clientId + ':' + clientSecret);
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(client_credentials);
    try {
      String _token = '';

      var body = {
        'grant_type': 'client_credentials',
      };

      final response = await Dio().post(
        'https://accounts.spotify.com/api/token',
        data: body,
        options: Options(
          headers: {
            "Accept": "application/json",
            //"Content-Type": "application/json",
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': 'Basic  $encoded'
          },
        ),
      );
      //print(response.data['access_token']);
      if (response.statusCode == 200) {
        _token = response.data['access_token'];
      }
      //print(_token);
      return _token;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<String> getToken() async {
    final storage = new FlutterSecureStorage();
    String? value = await storage.read(key: 'token');
    return value!;
  }
}
