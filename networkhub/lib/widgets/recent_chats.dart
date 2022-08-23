import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:networkhub/config/urls.dart';
import 'package:networkhub/modules/channel/models/channel.dart';
import 'package:intl/intl.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({Key? key, required this.channels}) : super(key: key);
  final List<Channel> channels;

  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: const BoxDecoration(
            // color: Theme.of(context).accentColor,
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: ListView.builder(
                itemCount: widget.channels.length,
                itemBuilder: (BuildContext content, int index) {
                  final Channel channel = widget.channels[index];
                  return GestureDetector(
                    onTap: (() => Beamer.of(context).beamToNamed(
                          Routes.channelDetail,
                          data: {'channel': channel},
                        )),
                    child: Container(
                      decoration: const BoxDecoration(
                          // if channel is accessed then color is white else this
                          color: Color(
                            0xFFFFEFEE,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      margin: const EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                        right: 5.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 35.0,
                                backgroundImage: NetworkImage(channel.image),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    channel.name,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    // TODO  add the latest message to model and display it here
                                    child: const Text(
                                      'latest message',
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                DateFormat('kk:mm').format(channel.createdAt),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              // TODO add a operator to handle if the chat has been read or not and do not display the NEW
                              Container(
                                width: 40.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Theme.of(context).primaryColor,
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'NEW',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
