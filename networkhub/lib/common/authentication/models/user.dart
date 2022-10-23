import 'package:equatable/equatable.dart';

class User extends Equatable {
  static const empty = User();
  final String? userHash;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? profileImage;
  final String? userColor;

  const User({
    this.userHash,
    this.email,
    this.firstName,
    this.lastName,
    this.country,
    this.profileImage,
    this.userColor,
  });

  User.fromJson(Map<String, Object?> json)
      : this(
          userHash: json['userHash']! as String,
          email: json['email']! as String,
          firstName: json['firstName']! as String,
          lastName: json['lastName']! as String,
          country: json['country']! as String,
          profileImage: json['profileImage'] == null
              ? ''
              : json['profileImage']! as String,
          userColor:
              json['userColor'] == null ? '' : json['userColor']! as String,
        );

  @override
  List<Object?> get props => [
        userHash,
        email,
        firstName,
        lastName,
        country,
        profileImage,
        userColor,
      ];

  Map<String, Object?> toJson() {
    return {
      'userHash': userHash,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'country': country,
      'profileImage': profileImage,
      'userColor': userColor,
    };
  }

  User copywith({
    String? userHash,
    String? email,
    String? firstName,
    String? lastName,
    String? country,
    String? profileImage,
    String? userColor,
  }) =>
      User(
        userHash: userHash ?? this.userHash,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        country: country ?? this.country,
        profileImage: profileImage ?? this.profileImage,
        userColor: userColor ?? this.userColor,
      );
}
