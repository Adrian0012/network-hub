import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/intro/screens/intro.dart';

class IntroLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.intro}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('intro'),
        child: IntroScreen(),
      ),
    ];
    return pages;
  }
}
