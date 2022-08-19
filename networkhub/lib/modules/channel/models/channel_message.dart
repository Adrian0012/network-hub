import 'package:json_annotation/json_annotation.dart';

part 'channel_message.g.dart';

@JsonSerializable()
class ChannelMessage {
  final int id;
  final String content;
  final int fromUser;
  // final AppUser user;
  final DateTime createdAt;
  final int channel;

  ChannelMessage(
    this.id,
    this.content,
    // this.user,
    this.createdAt,
    this.channel,
    this.fromUser,
  );

  factory ChannelMessage.fromJson(Map<String, dynamic> json) =>
      _$ChannelMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelMessageToJson(this);
}
