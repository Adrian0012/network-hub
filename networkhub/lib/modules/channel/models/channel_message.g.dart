// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelMessage _$ChannelMessageFromJson(Map<String, dynamic> json) =>
    ChannelMessage(
      json['messageHash'] as String,
      json['content'] as String,
      AppUser.fromJson(json['fromUser'] as Map<String, dynamic>),
      DateTime.parse(json['createdAt'] as String),
      json['channelHash'] as String,
    );

Map<String, dynamic> _$ChannelMessageToJson(ChannelMessage instance) =>
    <String, dynamic>{
      'messageHash': instance.messageHash,
      'content': instance.content,
      'fromUser': instance.fromUser,
      'createdAt': instance.createdAt.toIso8601String(),
      'channelHash': instance.channelHash,
    };
