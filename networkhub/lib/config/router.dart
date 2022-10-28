import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/location.dart';
import 'package:networkhub/modules/common/authentication/auth/bloc/auth_bloc.dart';
import 'package:networkhub/modules/common/authentication/login/location.dart';
import 'package:networkhub/modules/dashboard/location.dart';
import 'package:networkhub/modules/intro/location.dart';

class AppRouter {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static BuildContext get context => scaffoldMessengerKey.currentState!.context;

  static final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        LoginLocation(),
        IntroLocation(),
        ChannelLocation(),
        DashboardLocation(),
      ],
    ),
    guards: [
      BeamGuard(
        pathPatterns: [
          '${Routes.login}*',
        ],
        check: (context, state) =>
            !context.read<AuthenticationBloc>().isAuthenticated,
        beamToNamed: (origin, target) => Routes.intro,
      ),
      BeamGuard(
        pathPatterns: [
          '${Routes.intro}*',
          '${Routes.account}*',
          '${Routes.dashboard}*',
          '${Routes.stats}*',
        ],
        check: (context, state) =>
            context.read<AuthenticationBloc>().isAuthenticated,
        beamToNamed: (origin, target) => Routes.login,
      ),
    ],
    initialPath: Routes.login,
  );
}
