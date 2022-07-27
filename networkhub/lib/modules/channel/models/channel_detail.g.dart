// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelDetail _$ChannelDetailFromJson(Map<String, dynamic> json) =>
    ChannelDetail(
      json['id'] as String,
      json['title'] as String,
      (json['messages'] as List<dynamic>)
          .map((e) => ChannelMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChannelDetailToJson(ChannelDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'messages': instance.messages,
      'createdAt': instance.createdAt.toIso8601String(),
    };
