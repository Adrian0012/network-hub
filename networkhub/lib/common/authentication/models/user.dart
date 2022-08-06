import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  static const empty = AppUser();
  final String? uid;
  final String? email;
  final bool? emailVerified;

  const AppUser({
    this.uid,
    this.email,
    this.emailVerified,
  });

  AppUser.fromJson(Map<String, Object?> json)
      : this(
          uid: json['uid']! as String,
          email: json['email']! as String,
        );

  @override
  List<Object?> get props => [
        uid,
        email,
      ];

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}
