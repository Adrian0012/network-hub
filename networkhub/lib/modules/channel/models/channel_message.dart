import 'package:json_annotation/json_annotation.dart';
import 'package:networkhub/common/authentication/models/user.dart';

part 'channel_message.g.dart';

@JsonSerializable()
class ChannelMessage {
  final String messageHash;
  final String content;
  final AppUser fromUser;
  final DateTime createdAt;
  final String channelHash;

  ChannelMessage(
    this.messageHash,
    this.content,
    this.fromUser,
    this.createdAt,
    this.channelHash,
  );

  factory ChannelMessage.fromJson(Map<String, dynamic> json) =>
      _$ChannelMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelMessageToJson(this);
}
