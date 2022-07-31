import 'package:dio/dio.dart';
import 'package:networkhub/modules/stats/models/stat.dart';
import 'package:networkhub/modules/stats/repositories/stats.dart';
import 'package:networkhub/modules/stats/repositories/stats_interface.dart';

class StatsController {
  final IStatsRepository _statsRepo = StatsRepository(Dio());

  Future<Stat> getStats() {
    return _statsRepo.getStats();
  }
}
