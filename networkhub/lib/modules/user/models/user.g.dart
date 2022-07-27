// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Appuser _$AppuserFromJson(Map<String, dynamic> json) => Appuser(
      json['firstName'] as String,
      json['lastName'] as String,
      json['country'] as String,
      json['authToken'] as String,
      json['profilePicture'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$AppuserToJson(Appuser instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'country': instance.country,
      'authToken': instance.authToken,
      'profilePicture': instance.profilePicture,
    };
