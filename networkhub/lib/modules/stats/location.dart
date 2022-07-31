import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/stats/screens/stats.dart';

class StatsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.stats}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('stats'),
        title: 'Stats',
        child: StatsScreen(),
      ),
    ];
    return pages;
  }
}
