import 'package:freezed_annotation/freezed_annotation.dart';

part 'file.freezed.dart';
part 'file.g.dart';

@freezed
class File with _$File {
  const factory File({
    required String name,
    required num size,
    required String htmlUrl,
    required String type,
    required String content,
    required String encoding,
  }) = _File;

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
}
