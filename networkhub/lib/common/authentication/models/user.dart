import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  static const empty = AppUser();
  final String? userHash;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? profileImage;
  final String? userColor;

  const AppUser({
    this.userHash,
    this.email,
    this.firstName,
    this.lastName,
    this.country,
    this.profileImage,
    this.userColor,
  });

  AppUser.fromJson(Map<String, Object?> json)
      : this(
          userHash: json['userHash']! as String,
          email: json['email']! as String,
          firstName: json['firstName']! as String,
          lastName: json['lastName']! as String,
          country: json['country']! as String,
          profileImage: json['profileImage']! as String,
          userColor: json['userColor']! as String,
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
}
