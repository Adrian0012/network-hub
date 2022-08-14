import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/blocs/channel_bloc.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ChannelBloc _channelBloc = ChannelBloc();

  @override
  void initState() {
    _channelBloc.add(GetChannelsList());
    super.initState();
  }

  final int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: _buildChannelsList(),
      bottomNavigationBar: NavigationBar(selectedIndex: _selectedIndex),
    );
  }

  Widget _buildChannelsList() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _channelBloc,
        child: BlocListener<ChannelBloc, ChannelState>(
          listener: (context, state) {
            // if (state is CovidError) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text(state.message!),
            //     ),
            //   );
            // }
          },
          child: BlocBuilder<ChannelBloc, ChannelState>(
            builder: (context, state) {
              if (state is ChannelsInitial) {
                return _buildLoading();
              } else if (state is ChannelsLoading) {
                return _buildLoading();
              } else if (state is ChannelLoaded) {
                return _buildCard(context, state.channels);
                // } else if (state is CovidError) {
                //   return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<Channel> model) {
    const height = 298.0;
    return ListView.builder(
      itemCount: model.length,
      itemBuilder: (context, index) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ChannelCardTitle(
                  title: model[index].name,
                ),
                SizedBox(
                  height: height,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: (() => Beamer.of(context).beamToNamed(
                            Routes.channelDetail,
                            data: {'channel': model[index]},
                          )),
                      splashColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.12),
                      highlightColor: Colors.transparent,
                      child: ChannelCardContent(
                        channel: model[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(
        child: LoadingAnimationWidget.dotsTriangle(
          color: const Color(0xFF1A1A3F),
          size: 200,
        ),
      );
}

class ChannelCardTitle extends StatelessWidget {
  const ChannelCardTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
      ),
    );
  }
}

class ChannelCardContent extends StatelessWidget {
  const ChannelCardContent({
    Key? key,
    required Channel channel,
  })  : _channel = channel,
        super(key: key);

  final Channel _channel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline5!.copyWith(color: Colors.white);
    final descriptionStyle = theme.textTheme.subtitle1!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 184,
          child: Stack(
            children: [
              Positioned.fill(
                child: Ink.image(
                  image: NetworkImage(
                    _channel.image,
                  ),
                  fit: BoxFit.cover,
                  child: Container(),
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _channel.name,
                    style: titleStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: DefaultTextStyle(
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: descriptionStyle,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    _channel.name,
                    style: descriptionStyle.copyWith(color: Colors.black54),
                  ),
                ),
                Text(_channel.region),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    Key? key,
    required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_rounded),
              label: 'Stats',
              backgroundColor: Colors.yellow),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_rounded),
            label: 'Account',
            backgroundColor: Colors.green,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: (index) {
          if (index == 0) {
            Beamer.of(context).beamToNamed(Routes.stats);
          } else if (index == 1) {
            Beamer.of(context).beamToNamed(Routes.dashboard);
          } else if (index == 2) {
            Beamer.of(context).beamToNamed(Routes.account);
          }
        },
        elevation: 5);
  }
}
