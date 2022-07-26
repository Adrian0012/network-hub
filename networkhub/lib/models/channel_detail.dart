import 'package:json_annotation/json_annotation.dart';

import 'channel_message.dart';

part 'channel_detail.g.dart';

@JsonSerializable()
class ChannelDetail {
  final String id;
  final String title;
  final List<ChannelMessage> messages;
  final DateTime createdAt;

  ChannelDetail(
    this.id,
    this.title,
    this.messages,
    this.createdAt,
  );

  factory ChannelDetail.fromJson(Map<String, dynamic> json) =>
      _$ChannelDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelDetailToJson(this);
}
