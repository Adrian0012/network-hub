import 'package:dio/dio.dart';
import 'package:networkhub/constants/rest_api_urls.dart';
import 'package:networkhub/modules/channel/models/channel.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseApi = RestApiUrls.baseUrl;
  final String _getChannels = RestApiUrls.getChannels;

  Future<List<Channel>> fetchChannelList() async {
    Response response = await _dio.get(_baseApi + _getChannels);
    if (response.statusCode == 200) {
      final List<Channel> result = List<Channel>.from(
          response.data.map((e) => Channel.fromJson(e)).toList());
      return result;
    } else {
      throw Error();
    }
  }
}
