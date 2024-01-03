import 'dart:developer';

import 'package:app/utils/api_urls.dart';
import 'package:dio/dio.dart';

class AuthService {
  Dio dio = Dio();

  Future<String?> authenticateUser(String username, String password) async {
    log('username:$username $password');
    const apiUrl = postApi;

    try {
      final response = await dio.post(
        apiUrl,
        data: {
          'username': username,
          'password': password,
        },
      );
      log('username:$username $password');

      if (response.statusCode == 200) {
        log('success:${response.data['data']['token']}');

        return response.data['data']['token'];
      } else {
        log('Failed:${response.data}');
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      log('Failed:${e.toString()}');

      return null;
    }
  }
}
