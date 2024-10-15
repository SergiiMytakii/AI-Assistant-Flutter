import 'package:freezed_annotation/freezed_annotation.dart';

part 'q_and_a.freezed.dart';
part 'q_and_a.g.dart';

@freezed
class QandAdocument with _$QandAdocument {
  // @JsonSerializable(explicitToJson: true)
  const factory QandAdocument({
    required List<Map<String, dynamic>> doc,
    required String fileName,
  }) = _QandAdocument;

  factory QandAdocument.fromJson(Map<String, dynamic> json) =>
      _$QandAdocumentFromJson(json);
}

@freezed
class QandA with _$QandA {
  const factory QandA({
    required String question,
    required String answer,
  }) = _QandA;

  factory QandA.fromJson(Map<String, dynamic> json) => _$QandAFromJson(json);
}
