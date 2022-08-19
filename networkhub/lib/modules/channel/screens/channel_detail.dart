import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/blocs/channel_details_bloc.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChannelDetailScreen extends StatefulWidget {
  const ChannelDetailScreen({Key? key, required this.channel})
      : super(key: key);

  final Channel channel;

  @override
  State<ChannelDetailScreen> createState() => _ChannelDetailScreenState();
}

class _ChannelDetailScreenState extends State<ChannelDetailScreen> {
  final ChannelDetailsBloc _channelDetailsBloc = ChannelDetailsBloc();

  @override
  void initState() {
    _channelDetailsBloc.add(GetChannelDetails(widget.channel));
    super.initState();
  }

  final int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel Details'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: _buildMessageList(),
      bottomNavigationBar: NavigationBar(selectedIndex: _selectedIndex),
    );
  }

  Widget _buildMessageList() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _channelDetailsBloc,
        child: BlocListener<ChannelDetailsBloc, ChannelDetailsState>(
          listener: (context, state) {
            // if (state is CovidError) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text(state.message!),
            //     ),
            //   );
            // }
          },
          child: BlocBuilder<ChannelDetailsBloc, ChannelDetailsState>(
            builder: (context, state) {
              if (state is ChannelDetailsInitial) {
                return _buildLoading();
              } else if (state is ChannelDetailsLoading) {
                return _buildLoading();
              } else if (state is ChannelDetailsLoaded) {
                return _buildChat(context, state.messages);
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
}

// Widget _buildChat(BuildContext context, List<ChannelMessage> model) {
//   return Column(
//     children: [
//       Expanded(child: Container()),
//       Container(
//         color: Colors.grey.shade300,
//         child: const TextField(
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(12),
//               hintText: 'Type your message here...'),
//         ),
//       )
//     ],
//   );
// }

@override
Widget _buildChat(BuildContext context) {
  final now = new DateTime.now();
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BubbleNormalAudio(
                color: Color(0xFFE8E8EE),
                duration: duration.inSeconds.toDouble(),
                position: position.inSeconds.toDouble(),
                isPlaying: isPlaying,
                isLoading: isLoading,
                isPause: isPause,
                onSeekChanged: _changeSeek,
                onPlayPauseButtonClick: _playAudio,
                sent: true,
              ),
              BubbleNormal(
                text: 'bubble normal with tail',
                isSender: false,
                color: Color(0xFF1B97F3),
                tail: true,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              BubbleNormal(
                text: 'bubble normal with tail',
                isSender: true,
                color: Color(0xFFE8E8EE),
                tail: true,
                sent: true,
              ),
              DateChip(
                date: new DateTime(now.year, now.month, now.day - 2),
              ),
              BubbleNormal(
                text: 'bubble normal without tail',
                isSender: false,
                color: Color(0xFF1B97F3),
                tail: false,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              BubbleNormal(
                text: 'bubble normal without tail',
                color: Color(0xFFE8E8EE),
                tail: false,
                sent: true,
                seen: true,
                delivered: true,
              ),
              BubbleSpecialOne(
                text: 'bubble special one with tail',
                isSender: false,
                color: Color(0xFF1B97F3),
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              DateChip(
                date: new DateTime(now.year, now.month, now.day - 1),
              ),
              BubbleSpecialOne(
                text: 'bubble special one with tail',
                color: Color(0xFFE8E8EE),
                seen: true,
              ),
              BubbleSpecialOne(
                text: 'bubble special one without tail',
                isSender: false,
                tail: false,
                color: Color(0xFF1B97F3),
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              BubbleSpecialOne(
                text: 'bubble special one without tail',
                tail: false,
                color: Color(0xFFE8E8EE),
                sent: true,
              ),
              BubbleSpecialTwo(
                text: 'bubble special tow with tail',
                isSender: false,
                color: Color(0xFF1B97F3),
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              DateChip(
                date: now,
              ),
              BubbleSpecialTwo(
                text: 'bubble special tow with tail',
                isSender: true,
                color: Color(0xFFE8E8EE),
                sent: true,
              ),
              BubbleSpecialTwo(
                text: 'bubble special tow without tail',
                isSender: false,
                tail: false,
                color: Color(0xFF1B97F3),
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              BubbleSpecialTwo(
                text: 'bubble special tow without tail',
                tail: false,
                color: Color(0xFFE8E8EE),
                delivered: true,
              ),
              BubbleSpecialThree(
                text: 'bubble special three without tail',
                color: Color(0xFF1B97F3),
                tail: false,
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              BubbleSpecialThree(
                text: 'bubble special three with tail',
                color: Color(0xFF1B97F3),
                tail: true,
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              BubbleSpecialThree(
                text: "bubble special three without tail",
                color: Color(0xFFE8E8EE),
                tail: false,
                isSender: false,
              ),
              BubbleSpecialThree(
                text: "bubble special three with tail",
                color: Color(0xFFE8E8EE),
                tail: true,
                isSender: false,
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
        MessageBar(
          onSend: (_) => print(_),
          actions: [
            InkWell(
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 24,
              ),
              onTap: () {},
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: InkWell(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.green,
                  size: 24,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    ),
    // This trailing comma makes auto-formatting nicer for build methods.
  );
}

Widget _buildLoading() => Center(
      child: LoadingAnimationWidget.dotsTriangle(
        color: const Color(0xFF1A1A3F),
        size: 200,
      ),
    );

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
