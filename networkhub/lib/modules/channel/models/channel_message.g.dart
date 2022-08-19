// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelMessage _$ChannelMessageFromJson(Map<String, dynamic> json) =>
    ChannelMessage(
      json['id'] as int,
      json['content'] as String,
      DateTime.parse(json['createdAt'] as String),
      json['channel'] as int,
      json['fromUser'] as int,
    );

Map<String, dynamic> _$ChannelMessageToJson(ChannelMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'fromUser': instance.fromUser,
      'createdAt': instance.createdAt.toIso8601String(),
      'channel': instance.channel,
    };
