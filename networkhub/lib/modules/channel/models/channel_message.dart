import 'package:json_annotation/json_annotation.dart';
import 'package:networkhub/common/authentication/models/user.dart';

part 'channel_message.g.dart';

@JsonSerializable()
class ChannelMessage {
  final int id;
  final String content;
  final int fromUser;
  // final AppUser user;
  final DateTime createdAt;
  final int channelId;

  ChannelMessage(
    this.id,
    this.content,
    // this.user,
    this.createdAt,
    this.channelId,
    this.fromUser,
  );

  factory ChannelMessage.fromJson(Map<String, dynamic> json) =>
      _$ChannelMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelMessageToJson(this);
}
