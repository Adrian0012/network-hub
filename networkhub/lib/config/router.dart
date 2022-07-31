import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/location.dart';
import 'package:networkhub/modules/dashboard/location.dart';
import 'package:networkhub/modules/index/location.dart';
import 'package:networkhub/modules/stats/location.dart';

class AppRouter {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static BuildContext get context => scaffoldMessengerKey.currentState!.context;

  static final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        IndexLocation(),
        ChannelsLocation(),
        DashboardLocation(),
        StatsLocation(),
      ],
    ),
    initialPath: Routes.index,
  );
}
