import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  final String channelHash;
  final String name;
  final String region;
  final String image;
  final String? latestMessage;
  final DateTime createdAt;

  Channel(
    this.channelHash,
    this.name,
    this.region,
    this.image,
    this.latestMessage,
    this.createdAt,
  );

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
