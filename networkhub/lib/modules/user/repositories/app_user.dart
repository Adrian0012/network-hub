import 'package:dio/dio.dart';
import 'package:networkhub/constants/rest_api_urls.dart';
import 'package:networkhub/modules/user/models/user.dart';

import 'app_user_interface.dart';

class AppuserRepository implements IAppuserRepository {
  final Dio _dio;

  AppuserRepository(this._dio);

  @override
  Future<List<Appuser>> getAll() async {
    var response = await _dio.get(RestApiUrls.getTestUsers);
    final List<Appuser> result = List<Appuser>.from(
        response.data.map((e) => Appuser.fromJson(e)).toList());
    return result;
  }
}
