// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appuser _$AppuserFromJson(Map<String, dynamic> json) => Appuser(
      email: json['email'] as String,
      authToken: json['authToken'] as String,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$AppuserToJson(Appuser instance) => <String, dynamic>{
      'email': instance.email,
      'authToken': instance.authToken,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };
