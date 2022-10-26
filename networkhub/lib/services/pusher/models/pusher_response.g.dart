// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pusher_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PusherResponse _$PusherResponseFromJson(Map<String, dynamic> json) =>
    PusherResponse(
      json['message'] as String,
      json['channelHash'] as String?,
      User.fromJson(json['fromUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PusherResponseToJson(PusherResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'channelHash': instance.channelHash,
      'fromUser': instance.fromUser,
    };
