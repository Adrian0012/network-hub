import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/features/channel/screens/channel_detail.dart';
import 'package:networkhub/features/channel/screens/channel_index.dart';

import '../../routes/routes.dart';

class ChannelsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns =>
      ['${Routes.channelIndex}/*', '${Routes.channelDetail}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('channelIndex'),
        title: 'Channels',
        child: ChannelIndexScreen(),
      ),
      const BeamPage(
        key: ValueKey('channelDetail'),
        title: 'Channel Detail',
        child: ChannelDetailScreen(),
      ),
    ];
    return pages;
  }
}
