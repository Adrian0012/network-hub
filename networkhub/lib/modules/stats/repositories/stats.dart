import 'package:dio/dio.dart';
import 'package:networkhub/constants/rest_api_urls.dart';
import 'package:networkhub/modules/stats/repositories/stats_interface.dart';

import '../models/stat.dart';

class StatsRepository implements IStatsRepository {
  final Dio _dio;

  StatsRepository(this._dio);

  @override
  Future<Stat> getStats() async {
    var response = await _dio.get(RestApiUrls.getStats);
    // final Stat result = List<Channel>.from(
    //     response.data.map((e) => Channel.fromJson(e)).toList());
    // return result;
    return Stat();
  }
}
