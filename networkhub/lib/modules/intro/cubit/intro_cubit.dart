import 'package:beamer/beamer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/intro/repository/intro_repository.dart';

part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  IntroCubit() : super(IntroInitial());
  final IntroRepository _introRepository = IntroRepository();

  Future<void> initSkynet(BuildContext context) async {
    // good example of getting some data and beaming to a location
    var route = Beamer.of(context);
    bool response = await _introRepository.initializeSkynet();
    if (response) {
      route.beamToNamed(Routes.dashboard);
    }
  }
}
