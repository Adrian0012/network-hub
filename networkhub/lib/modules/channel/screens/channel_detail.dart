import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:networkhub/common/authentication/repositories/user_repository.dart';
import 'package:networkhub/modules/channel/blocs/channel_details_bloc.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';
import 'package:networkhub/services/pusher/pusher_service.dart';
import 'package:networkhub/widgets/chats/message_composer.dart';

class ChannelDetailScreen extends StatefulWidget {
  const ChannelDetailScreen({Key? key, required this.channel})
      : super(key: key);

  final Channel channel;

  @override
  State<ChannelDetailScreen> createState() => _ChannelDetailScreenState();
}

class _ChannelDetailScreenState extends State<ChannelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            PusherService.instance()
                .onPusherUnSubscribe(widget.channel.channelHash);
            Beamer.of(context).beamBack();
          },
        ),
        title: Text(
          widget.channel.name,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _buildMessageList(),
    );
  }

  Widget _buildMessageList() {
    final ChannelDetailsBloc channelDetailsBloc =
        ChannelDetailsBloc(userRepository: context.read<UserRepository>());
    channelDetailsBloc.add(GetChannelDetails(widget.channel));
    return BlocProvider(
      create: (_) => channelDetailsBloc,
      child: BlocListener<ChannelDetailsBloc, ChannelDetailsState>(
        listener: (context, state) {
          if (state is ChannelDetailsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<ChannelDetailsBloc, ChannelDetailsState>(
            builder: (context, state) {
          if (state is ChannelDetailsInitial) {
            return _buildLoading();
          } else if (state is ChannelDetailsLoading) {
            return _buildLoading();
          } else if (state is ChannelDetailsLoaded) {
            return _buildChatScreen(context, state.messages, state.channelHash);
          } else {
            // TODO create an error page
            return Container();
          }
        }),
      ),
    );
  }
}

Widget _buildChatScreen(
    BuildContext context, List<ChannelMessage> model, String channelHash) {
  return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: ClipRRect(
              child: ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.only(top: 15.0),
                  itemCount: model.isNotEmpty ? model.length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    final ChannelMessage msg = model[index];
                    bool isMe = msg.fromUser.userHash ==
                        context
                            .read<UserRepository>()
                            .userStreamController
                            .value
                            .userHash;
                    return _buildMessage(context, msg, isMe);
                  }),
            ),
          ),
        ),
        MessageComposer(channelHash: channelHash)
      ],
    ),
  );
}

Widget _buildMessage(BuildContext context, ChannelMessage msg, bool isMe) {
  final Container message = Container(
    margin: isMe
        ? const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 80.0,
          )
        : const EdgeInsets.only(top: 8.0, bottom: 8.0),
    padding: const EdgeInsets.symmetric(
      horizontal: 25.0,
      vertical: 15.0,
    ),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
      color: isMe
          ? Theme.of(context).accentColor
          : Color(int.parse(msg.fromUser.userColor as String)),
      borderRadius: isMe
          ? const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(
                15.0,
              ),
            )
          : const BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(
                15.0,
              ),
            ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          DateFormat('kk:mm').format(msg.createdAt as DateTime),
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(msg.content as String),
      ],
    ),
  );

  if (isMe) {
    return message;
  }

  return Row(
    children: [
      message,
      IconButton(
        // if msg is liked then show favorite else as below
        icon: const Icon(Icons.favorite_border),
        iconSize: 30.0,
        // update color too
        color: Colors.blueGrey,
        onPressed: () {},
      )
    ],
  );
}

Widget _buildLoading() => Center(
      child: LoadingAnimationWidget.dotsTriangle(
        color: const Color(0xFF1A1A3F),
        size: 200,
      ),
    );
