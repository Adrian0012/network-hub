import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:networkhub/common/authentication/models/user.dart';

part 'channel_message.g.dart';

@JsonSerializable()
class ChannelMessage extends Equatable {
  final String? messageHash;
  final String content;
  final User fromUser;
  final DateTime createdAt;
  final String? channelHash;

  ChannelMessage(
    this.messageHash,
    this.content,
    this.fromUser,
    this.createdAt,
    this.channelHash,
  );

  @override
  List<Object?> get props => [
        messageHash,
        content,
        fromUser,
        createdAt,
        channelHash,
      ];

  final List<ChannelMessage> messages = [];

  factory ChannelMessage.fromJson(Map<String, dynamic> json) =>
      _$ChannelMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelMessageToJson(this);
}
