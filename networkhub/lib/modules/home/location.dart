import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/common/authentication/login/views/login_page.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/home/views/home.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.home}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('home'),
        title: 'home',
        child: HomePage(),
      ),
      // const BeamPage(
      //   key: ValueKey('login'),
      //   title: 'login',
      //   child: LoginPage(),
      // ),
    ];
    return pages;
  }
}
