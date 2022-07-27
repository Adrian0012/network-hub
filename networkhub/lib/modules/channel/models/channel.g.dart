// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      json['id'] as String,
      json['title'] as String,
      json['userCount'] as int,
      json['messageCount'] as int,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userCount': instance.userCount,
      'messageCount': instance.messageCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
