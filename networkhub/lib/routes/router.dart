import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/routes/routes.dart';
import '../features/channel/location.dart';
import '../features/index/location.dart';

class AppRouter {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static BuildContext get context => scaffoldMessengerKey.currentState!.context;

  static final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        IndexLocation(),
        ChannelsLocation(),
      ],
    ),
    initialPath: Routes.index,
  );
}
