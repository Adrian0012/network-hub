import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:networkhub/modules/channel/blocs/channel_bloc.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/widgets/category_selector.dart';
import 'package:networkhub/widgets/loading.dart';
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

  // final int _selectedIndex = 1;

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
      // bottomNavigationBar: Navbar(selectedIndex: _selectedIndex),
    );
  }

  Widget _buildChatroomsList() {
    return BlocProvider(
      create: (_) => _channelBloc,
      child: BlocListener<ChannelBloc, ChannelState>(
        listener: (context, state) {
          if (state is ChannelError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<ChannelBloc, ChannelState>(
          builder: (context, state) {
            if (state is ChannelsInitial) {
              return const Loading();
            } else if (state is ChannelsLoading) {
              return const Loading();
            } else if (state is ChannelLoaded) {
              return _buildChatroom(context, state.channels);
            } else {
              // TODO create an error page
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
