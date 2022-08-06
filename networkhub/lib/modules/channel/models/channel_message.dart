import 'package:json_annotation/json_annotation.dart';
import 'package:networkhub/common/authentication/models/user.dart';

part 'channel_message.g.dart';

@JsonSerializable()
class ChannelMessage {
  final String id;
  final String content;
  final AppUser user;
  final DateTime createdAt;

  ChannelMessage(
    this.id,
    this.content,
    this.user,
    this.createdAt,
  );

  factory ChannelMessage.fromJson(Map<String, dynamic> json) =>
      _$ChannelMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelMessageToJson(this);
}
