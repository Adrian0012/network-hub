import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:networkhub/modules/channel/blocs/channel_details_bloc.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:networkhub/modules/channel/models/channel_message.dart';
import 'package:networkhub/widgets/chats/message_composer.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
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
    return BlocProvider(
      create: (_) => _channelDetailsBloc,
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
            // return _buildChat(context, state.messages, widget.channel);
            return _buildChatScreen(context, state.messages);
          } else {
            // TODO create an error page
            return Container();
          }
        }),
      ),
    );
  }
}

Widget _buildChatScreen(BuildContext context, List<ChannelMessage> model) {
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
                  itemCount: model.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ChannelMessage msg = model[index];
                    const bool isMe = false;
                    // bool that check if the message has been sent by me or not
                    return _buildMessage(context, msg, isMe);
                  }),
            ),
          ),
        ),
        // _buildMessageComposer(context)
        const MessageComposer()
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
        : const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
          ),
    padding: const EdgeInsets.symmetric(
      horizontal: 25.0,
      vertical: 15.0,
    ),
    width: MediaQuery.of(context).size.width * 0.75,
    decoration: BoxDecoration(
      color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
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

// Widget _buildMessageComposer(BuildContext context) {
//   return Container(
//     padding: const EdgeInsets.symmetric(
//       horizontal: 8.0,
//     ),
//     height: 70.0,
//     color: Colors.white,
//     child: Row(
//       children: <Widget>[
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.photo),
//           color: Theme.of(context).primaryColor,
//         ),
//         Expanded(
//           child: TextField(
//             textCapitalization: TextCapitalization.sentences,
//             onChanged: (value) {},
//             decoration:
//                 const InputDecoration.collapsed(hintText: 'Send a message...'),
//             onSubmitted: ((value) => {
//                   context.read<ChannelDetailsBloc>().add(
//                         SendChannelMessage(value),
//                       )
//                 }),
//           ),
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.send),
//           color: Theme.of(context).primaryColor,
//         )
//       ],
//     ),
//   );
// }

Widget _buildLoading() => Center(
      child: LoadingAnimationWidget.dotsTriangle(
        color: const Color(0xFF1A1A3F),
        size: 200,
      ),
    );
