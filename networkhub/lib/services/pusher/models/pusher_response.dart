import 'package:json_annotation/json_annotation.dart';
import 'package:networkhub/modules/common/authentication/models/user.dart';

part 'pusher_response.g.dart';

@JsonSerializable()
class PusherResponse {
  final String message;
  final String? channelHash;
  final User fromUser;

  PusherResponse(
    this.message,
    this.channelHash,
    this.fromUser,
  );

  factory PusherResponse.fromJson(Map<String, dynamic> json) =>
      _$PusherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PusherResponseToJson(this);
}
