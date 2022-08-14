import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/user/screens/user_profile.dart';

class UserAccountLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.account}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('user/account'),
        child: UserAccountScreen(),
      ),
    ];
    return pages;
  }
}
