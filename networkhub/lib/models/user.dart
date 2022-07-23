import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class Appuser {
  /// The generated code assumes these values exist in JSON.
  final String email;
  final String authToken;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.
  final DateTime? dateOfBirth;

  Appuser({required this.email, required this.authToken, this.dateOfBirth});

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Appuser.fromJson(Map<String, dynamic> json) =>
      _$AppuserFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AppuserToJson(this);
}
