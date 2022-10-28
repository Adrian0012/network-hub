import 'dart:convert';

import 'package:http/http.dart';
import 'package:networkhub/constants/rest_api_urls.dart';

class IntroProvider {
  final String _baseApi = RestApiUrls.baseUrl;

  Future<bool> initializeSkynet() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    Response response = await get(
      Uri.parse('$_baseApi/initialize_skynet'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body)['data'];
      if (responseData) {
        return true;
      } else {
        return false;
      }
    } else {
      throw 'API Initialize Skynet Error';
    }
  }
}
