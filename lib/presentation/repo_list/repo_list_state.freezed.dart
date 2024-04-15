// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepoListState _$RepoListStateFromJson(Map<String, dynamic> json) {
  return _RepoListState.fromJson(json);
}

/// @nodoc
mixin _$RepoListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Post> get post => throw _privateConstructorUsedError;
  List<Repo> get respos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepoListStateCopyWith<RepoListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoListStateCopyWith<$Res> {
  factory $RepoListStateCopyWith(
          RepoListState value, $Res Function(RepoListState) then) =
      _$RepoListStateCopyWithImpl<$Res, RepoListState>;
  @useResult
  $Res call({bool isLoading, List<Post> post, List<Repo> respos});
}

/// @nodoc
class _$RepoListStateCopyWithImpl<$Res, $Val extends RepoListState>
    implements $RepoListStateCopyWith<$Res> {
  _$RepoListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? post = null,
    Object? respos = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      respos: null == respos
          ? _value.respos
          : respos // ignore: cast_nullable_to_non_nullable
              as List<Repo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepoListStateImplCopyWith<$Res>
    implements $RepoListStateCopyWith<$Res> {
  factory _$$RepoListStateImplCopyWith(
          _$RepoListStateImpl value, $Res Function(_$RepoListStateImpl) then) =
      __$$RepoListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Post> post, List<Repo> respos});
}

/// @nodoc
class __$$RepoListStateImplCopyWithImpl<$Res>
    extends _$RepoListStateCopyWithImpl<$Res, _$RepoListStateImpl>
    implements _$$RepoListStateImplCopyWith<$Res> {
  __$$RepoListStateImplCopyWithImpl(
      _$RepoListStateImpl _value, $Res Function(_$RepoListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? post = null,
    Object? respos = null,
  }) {
    return _then(_$RepoListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      post: null == post
          ? _value._post
          : post // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      respos: null == respos
          ? _value._respos
          : respos // ignore: cast_nullable_to_non_nullable
              as List<Repo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepoListStateImpl implements _RepoListState {
  const _$RepoListStateImpl(
      {this.isLoading = false,
      final List<Post> post = const [],
      final List<Repo> respos = const []})
      : _post = post,
        _respos = respos;

  factory _$RepoListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepoListStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  final List<Post> _post;
  @override
  @JsonKey()
  List<Post> get post {
    if (_post is EqualUnmodifiableListView) return _post;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_post);
  }

  final List<Repo> _respos;
  @override
  @JsonKey()
  List<Repo> get respos {
    if (_respos is EqualUnmodifiableListView) return _respos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_respos);
  }

  @override
  String toString() {
    return 'RepoListState(isLoading: $isLoading, post: $post, respos: $respos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepoListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._post, _post) &&
            const DeepCollectionEquality().equals(other._respos, _respos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_post),
      const DeepCollectionEquality().hash(_respos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepoListStateImplCopyWith<_$RepoListStateImpl> get copyWith =>
      __$$RepoListStateImplCopyWithImpl<_$RepoListStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepoListStateImplToJson(
      this,
    );
  }
}

abstract class _RepoListState implements RepoListState {
  const factory _RepoListState(
      {final bool isLoading,
      final List<Post> post,
      final List<Repo> respos}) = _$RepoListStateImpl;

  factory _RepoListState.fromJson(Map<String, dynamic> json) =
      _$RepoListStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  List<Post> get post;
  @override
  List<Repo> get respos;
  @override
  @JsonKey(ignore: true)
  _$$RepoListStateImplCopyWith<_$RepoListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
