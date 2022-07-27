import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/index/screens/index.dart';

class IndexLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.index}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('index'),
        title: 'Index',
        child: IndexScreen(),
      ),
    ];
    return pages;
  }
}
