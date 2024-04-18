// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepoListStateImpl _$$RepoListStateImplFromJson(Map<String, dynamic> json) =>
    _$RepoListStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      post: (json['post'] as List<dynamic>?)
              ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      respos: (json['respos'] as List<dynamic>?)
              ?.map((e) => Repo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RepoListStateImplToJson(_$RepoListStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'post': instance.post,
      'respos': instance.respos,
      'user': instance.user,
    };
