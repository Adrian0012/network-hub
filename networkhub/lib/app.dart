import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/routes/router.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routerDelegate = AppRouter.routerDelegate;
    return BeamerProvider(
      routerDelegate: routerDelegate,
      child: MaterialApp.router(
        scaffoldMessengerKey: AppRouter.scaffoldMessengerKey,
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
        backButtonDispatcher:
            BeamerBackButtonDispatcher(delegate: routerDelegate),
      ),
    );
  }
}
