// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Channel _$ChannelFromJson(Map<String, dynamic> json) => Channel(
      json['id'] as int,
      json['name'] as String,
      json['region'] as String,
      json['image'] as String,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ChannelToJson(Channel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'region': instance.region,
      'image': instance.image,
      'createdAt': instance.createdAt.toIso8601String(),
    };
