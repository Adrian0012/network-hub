import 'package:networkhub/modules/stats/models/stat.dart';

abstract class IStatsRepository {
  Future<Stat> getStats();
}
