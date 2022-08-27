import 'dart:convert';

import 'package:http/http.dart';
import 'package:networkhub/common/authentication/models/user.dart';
import 'package:networkhub/constants/rest_api_urls.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';

class ApiProvider {
  final String _baseApi = RestApiUrls.baseUrl;

  Future<User> userLogin(String email, String password) async {
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
        final User result = User.fromJson(responseData['user']);
        return result;
      } else {
        throw 'API User Error';
      }
    } else {
      // TODO send a sentry error
      throw 'API Error';
    }
  }

  Future<List<Channel>> fetchChannelList() async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    Response response = await get(
      Uri.parse('$_baseApi/channels/'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData != null) {
        final List<Channel> result = List<Channel>.from(
            responseData.map((e) => Channel.fromJson(e)).toList());
        return result;
      } else {
        throw 'API GET Channel List Error';
      }
    } else {
      // TODO send a sentry error
      throw 'API Error';
    }
  }

  Future<List<ChannelMessage>> fetchChannelMessages(String channelId) async {
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    Response response = await get(
      Uri.parse('$_baseApi//messages/channel/$channelId'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData != null) {
        final List<ChannelMessage> result = List<ChannelMessage>.from(
            responseData.map((e) => ChannelMessage.fromJson(e)).toList());
        return result;
      } else {
        throw 'GET Channel Messages Error';
      }
    } else {
      // TODO send a sentry error
      throw 'API Error';
    }
  }
}
