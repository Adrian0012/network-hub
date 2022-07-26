import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';

import 'views/login_page.dart';

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.login}/*'];

  // Map get _data => (data as Map);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('login'),
          title: 'login',
          child: LoginPage(),
        ),
      ];
}
