// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FileInfo _$FileInfoFromJson(Map<String, dynamic> json) {
  return _File.fromJson(json);
}

/// @nodoc
mixin _$File {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  num get size => throw _privateConstructorUsedError;
  String get htmlUrl => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get encoding => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileCopyWith<FileInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileCopyWith<$Res> {
  factory $FileCopyWith(FileInfo value, $Res Function(FileInfo) then) = _$FileCopyWithImpl<$Res, FileInfo>;
  @useResult
  $Res call({String name, String path, num size, String htmlUrl, String downloadUrl, String type, String content, String encoding});
}

/// @nodoc
class _$FileCopyWithImpl<$Res, $Val extends FileInfo> implements $FileCopyWith<$Res> {
  _$FileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? size = null,
    Object? htmlUrl = null,
    Object? downloadUrl = null,
    Object? type = null,
    Object? content = null,
    Object? encoding = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as num,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      encoding: null == encoding
          ? _value.encoding
          : encoding // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileImplCopyWith<$Res> implements $FileCopyWith<$Res> {
  factory _$$FileImplCopyWith(_$FileImpl value, $Res Function(_$FileImpl) then) = __$$FileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String path, num size, String htmlUrl, String downloadUrl, String type, String content, String encoding});
}

/// @nodoc
class __$$FileImplCopyWithImpl<$Res> extends _$FileCopyWithImpl<$Res, _$FileImpl> implements _$$FileImplCopyWith<$Res> {
  __$$FileImplCopyWithImpl(_$FileImpl _value, $Res Function(_$FileImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? size = null,
    Object? htmlUrl = null,
    Object? downloadUrl = null,
    Object? type = null,
    Object? content = null,
    Object? encoding = null,
  }) {
    return _then(_$FileImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as num,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      encoding: null == encoding
          ? _value.encoding
          : encoding // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileImpl implements _File {
  const _$FileImpl({required this.name, required this.path, required this.size, required this.htmlUrl, required this.downloadUrl, required this.type, required this.content, required this.encoding});

  factory _$FileImpl.fromJson(Map<String, dynamic> json) => _$$FileImplFromJson(json);

  @override
  final String name;
  @override
  final String path;
  @override
  final num size;
  @override
  final String htmlUrl;
  @override
  final String downloadUrl;
  @override
  final String type;
  @override
  final String content;
  @override
  final String encoding;

  @override
  String toString() {
    return 'File(name: $name, path: $path, size: $size, htmlUrl: $htmlUrl, downloadUrl: $downloadUrl, type: $type, content: $content, encoding: $encoding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.encoding, encoding) || other.encoding == encoding));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, path, size, htmlUrl, downloadUrl, type, content, encoding);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileImplCopyWith<_$FileImpl> get copyWith => __$$FileImplCopyWithImpl<_$FileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileImplToJson(
      this,
    );
  }
}

abstract class _File implements FileInfo {
  const factory _File(
      {required final String name,
      required final String path,
      required final num size,
      required final String htmlUrl,
      required final String downloadUrl,
      required final String type,
      required final String content,
      required final String encoding}) = _$FileImpl;

  factory _File.fromJson(Map<String, dynamic> json) = _$FileImpl.fromJson;

  @override
  String get name;
  @override
  String get path;
  @override
  num get size;
  @override
  String get htmlUrl;
  @override
  String get downloadUrl;
  @override
  String get type;
  @override
  String get content;
  @override
  String get encoding;
  @override
  @JsonKey(ignore: true)
  _$$FileImplCopyWith<_$FileImpl> get copyWith => throw _privateConstructorUsedError;
}
