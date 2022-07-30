import 'package:dio/dio.dart';
import 'package:networkhub/constants/rest_api_urls.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/repositories/channel_interface.dart';

class ChannelRepository implements IChannelRepository {
  final Dio _dio;

  ChannelRepository(this._dio);

  @override
  Future<List<Channel>> getAll() async {
    var response = await _dio.get(RestApiUrls.getChannels);
    final List<Channel> result = List<Channel>.from(
        response.data.map((e) => Channel.fromJson(e)).toList());
    return result;
  }
}
