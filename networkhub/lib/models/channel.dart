import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  final String id;
  final String title;
  final int userCount;
  final int messageCount;
  final DateTime createdAt;

  Channel(
    this.id,
    this.title,
    this.userCount,
    this.messageCount,
    this.createdAt,
  );

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
