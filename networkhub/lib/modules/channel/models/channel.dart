import 'package:json_annotation/json_annotation.dart';

part 'channel.g.dart';

@JsonSerializable()
class Channel {
  final int id;
  final String name;
  final String region;
  final String image;
  final DateTime createdAt;

  Channel(
    this.id,
    this.name,
    this.region,
    this.image,
    this.createdAt,
  );

  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}
