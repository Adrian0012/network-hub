// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelMessage _$ChannelMessageFromJson(Map<String, dynamic> json) =>
    ChannelMessage(
      json['id'] as String,
      json['content'] as String,
      AppUser.fromJson(json['user'] as Map<String, dynamic>),
      DateTime.parse(json['createdAt'] as String),
      json['channelId'] as String,
    );

Map<String, dynamic> _$ChannelMessageToJson(ChannelMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
      'channelId': instance.channelId,
    };
