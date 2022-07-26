import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class Appuser {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String country;
  final String authToken;
  final String profilePicture;

  Appuser(this.firstName, this.lastName, this.country, this.authToken,
      this.profilePicture,
      {required this.id, required this.email});

  factory Appuser.fromJson(Map<String, dynamic> json) =>
      _$AppuserFromJson(json);

  Map<String, dynamic> toJson() => _$AppuserToJson(this);
}
