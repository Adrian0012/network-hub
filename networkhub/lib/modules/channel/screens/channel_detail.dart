import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:networkhub/modules/channel/blocs/channel_details_bloc.dart';
import 'package:networkhub/modules/channel/models/channel.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel Details'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: _buildMessageList(),
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
                // return _buildChat(context, state.messages, widget.channel);
                return Container();
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

Widget _buildLoading() => Center(
      child: LoadingAnimationWidget.dotsTriangle(
        color: const Color(0xFF1A1A3F),
        size: 200,
      ),
    );
