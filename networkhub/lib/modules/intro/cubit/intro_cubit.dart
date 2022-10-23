import 'package:beamer/beamer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:networkhub/common/providers/api_provider.dart';
import 'package:networkhub/config/urls.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());
  final ApiProvider _apiProvider = ApiProvider();

  Future<void> initSkynet(BuildContext context) async {
    var route = Beamer.of(context).beamToNamed(Routes.dashboard);
    bool respose = await _apiProvider.initializeSkynet();
    if (respose) {
      route;
    }
  }
}
