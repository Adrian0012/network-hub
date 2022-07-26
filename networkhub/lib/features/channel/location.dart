import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/features/channel/screens/channel_detail.dart';
import 'package:networkhub/features/channel/screens/channel_index.dart';
import 'package:networkhub/features/dashboard/screens/dashboard.dart';

import '../../routes/routes.dart';

class ChannelsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.channelIndex}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        const BeamPage(
          key: ValueKey('channelIndex'),
          title: 'channelIndex',
          child: ChannelIndexScreen(),
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
