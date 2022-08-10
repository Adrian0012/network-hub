import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkhub/common/authentication/bloc/authentication_bloc.dart';
import 'package:networkhub/common/authentication/login/location.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/location.dart';
import 'package:networkhub/modules/dashboard/location.dart';
import 'package:networkhub/modules/home/location.dart';
import 'package:networkhub/modules/index/location.dart';
import 'package:networkhub/modules/stats/location.dart';

class AppRouter {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static BuildContext get context => scaffoldMessengerKey.currentState!.context;

  static final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        LoginLocation(),
        IndexLocation(),
        ChannelsLocation(),
        DashboardLocation(),
        StatsLocation(),
        HomeLocation(),
      ],
    ),
    guards: [
      BeamGuard(
        pathPatterns: [
          '${Routes.login}*',
        ],
        check: (context, state) =>
            !context.read<AuthenticationBloc>().isAuthenticated,
        beamToNamed: (origin, target) => Routes.home,
      ),
      BeamGuard(
        pathPatterns: [
          '${Routes.home}*',
        ],
        check: (context, state) =>
            context.read<AuthenticationBloc>().isAuthenticated,
        beamToNamed: (origin, target) => Routes.login,
      ),
    ],
    initialPath: Routes.login,
  );
}
