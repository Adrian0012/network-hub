import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/screens/channel_detail.dart';

class ChannelLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.channelDetail}/*'];

  Map get _data => (data as Map);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
          key: const ValueKey('channel/detail'),
          child: ChannelDetailScreen(channel: _data['channel'])),
    ];
    return pages;
  }
}
