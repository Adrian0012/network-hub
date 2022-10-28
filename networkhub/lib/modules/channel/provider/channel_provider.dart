import 'dart:convert';

import 'package:http/http.dart';
import 'package:networkhub/constants/rest_api_urls.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';
import 'package:networkhub/services/secure_storage/storage_item.dart';
import 'package:networkhub/services/secure_storage/storage_service.dart';

class ChannelProvider {
  final String _baseApi = RestApiUrls.baseUrl;
  final StorageService _storageService = StorageService.instance();

  Future<List<Channel>> fetchChannelList() async {
    String? securityToken =
        await _storageService.read(key: Token.key) as String;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Token $securityToken",
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
      throw 'API Error';
    }
  }

  Future<List<ChannelMessage>> fetchChannelMessages(String channelId) async {
    String? securityToken =
        await _storageService.read(key: Token.key) as String;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Token $securityToken",
    };
    Response response = await get(
      Uri.parse('$_baseApi/channel/$channelId/messages'),
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
      throw 'API Error';
    }
  }

  void sendMessage(ChannelMessage message) async {
    String? securityToken =
        await _storageService.read(key: Token.key) as String;
    final String channeld = message.channelHash as String;
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Token $securityToken",
    };
    await post(
      Uri.parse('$_baseApi/channel/$channeld/messages/'),
      headers: headers,
      body: jsonEncode(message.toJson()),
    );
  }
}
