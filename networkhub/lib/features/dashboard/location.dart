import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/features/dashboard/screens/dashboard.dart';

import '../../routes/routes.dart';

class DashboardLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.dashboard}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('dashboard'),
        title: 'Dashboard',
        child: DashboardScreen(),
      ),
    ];
    return pages;
  }
}
