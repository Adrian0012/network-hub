import 'dart:convert';

import 'package:http/http.dart';
import 'package:networkhub/constants/rest_api_urls.dart';
import 'package:networkhub/modules/common/authentication/models/user.dart';
import 'package:networkhub/services/secure_storage/storage_item.dart';
import 'package:networkhub/services/secure_storage/storage_service.dart';

class AuthProvider {
  final String _baseApi = RestApiUrls.baseUrl;
  final StorageService _storageService = StorageService.instance();

  Future<bool> userLogin(String email, String password) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };

    final data = jsonEncode(<String, String>{
      'email': email,
      'password': password,
    });
    Response response = await post(
      Uri.parse('$_baseApi/login/'),
      headers: headers,
      body: data,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData != null) {
        await _storageService.write(
          key: Token.key,
          value: responseData['token'],
        );
        return true;
      } else {
        throw 'Login - API Response error';
      }
    } else {
      throw 'Login - API Server Error';
    }
  }

  Future<User> getUser() async {
    String? securityToken =
        await _storageService.read(key: Token.key) as String;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Token $securityToken",
    };

    Response response = await get(
      Uri.parse('$_baseApi/user/'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData != null) {
        final User user = User.fromJson(responseData);
        return user;
      } else {
        throw 'Get User - API Response error';
      }
    } else {
      throw 'Get User - API Server Error';
    }
  }
}
