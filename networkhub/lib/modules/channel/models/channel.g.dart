// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      json['channelHash'] as String,
      json['name'] as String,
      json['region'] as String,
      json['image'] as String,
      json['latestMessage'] as String?,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'channelHash': instance.channelHash,
      'name': instance.name,
      'region': instance.region,
      'image': instance.image,
      'latestMessage': instance.latestMessage,
      'createdAt': instance.createdAt.toIso8601String(),
    };
