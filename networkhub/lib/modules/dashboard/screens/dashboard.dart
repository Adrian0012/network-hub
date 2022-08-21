import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/blocs/channel_bloc.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:networkhub/widgets/category_selector.dart';
import 'package:networkhub/widgets/recent_chats.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {},
        ),
        title: const Text(
          'Chatrooms',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _buildChatroomsList(),
      bottomNavigationBar: NavigationBar(selectedIndex: _selectedIndex),
    );
  }

  Widget _buildChatroomsList() {
    return BlocProvider(
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
              return _buildChatroom(context, state.channels);
              // } else if (state is CovidError) {
              //   return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

Widget _buildChatroom(BuildContext context, List<Channel> model) {
  return Column(
    children: <Widget>[
      const CategorySelector(),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(children: <Widget>[
            RecentChats(
              channels: model,
            ),
          ]),
        ),
      )
    ],
  );
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

Widget _buildLoading() => Center(
      child: LoadingAnimationWidget.dotsTriangle(
        color: const Color(0xFF1A1A3F),
        size: 200,
      ),
    );
