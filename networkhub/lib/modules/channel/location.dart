import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/screens/channel_detail.dart';
import 'package:networkhub/modules/dashboard/screens/dashboard.dart';
import 'package:networkhub/modules/stats/screens/stats.dart';

class ChannelsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.channelDetail}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('stats'),
          title: 'stats',
          child: StatsScreen(),
        ),
        if (state.uri.pathSegments.contains('channelDetail'))
          const BeamPage(
            key: ValueKey('channelDetail'),
            title: 'channelDetail',
            child: ChannelDetailScreen(),
          ),
        if (state.uri.pathSegments.contains('dashboard'))
          const BeamPage(
            key: ValueKey('dashboard'),
            title: 'dashboard',
            child: DashboardScreen(),
          ),
      ];
}
