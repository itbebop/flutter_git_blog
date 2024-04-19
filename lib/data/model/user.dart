import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String htmlUrl,
    required String bio,
    required String avatarUrl,
    required int followers,
    required int following,
    required String blog,
    required String company,
    required int publicRepos,
    required String location,
    required String email,
    required String type,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
