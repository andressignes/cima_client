import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

enum DocumentType {
  @JsonValue(1)
  fichaTecnica,
  @JsonValue(2)
  prospecto,
  @JsonValue(3)
  informePublicoEvaluacion,
  @JsonValue(4)
  planGestionRiesgos
}

@JsonSerializable()
class Document extends Equatable {
  Document({
    required this.type,
    required this.url,
    required this.htmlAvailable,
    this.urlHtml,
    this.lastModified,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  @JsonKey(name: 'tipo')
  final DocumentType type;
  @JsonKey(name: 'url')
  final Uri url;
  @JsonKey(name: 'secc', defaultValue: false)
  final bool htmlAvailable;
  final String? urlHtml;
  @JsonKey(name: 'fecha', fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
  final DateTime? lastModified;

  Map<String, dynamic> toJson() => _$DocumentToJson(this);

  @override
  List<Object?> get props => [
        type,
        url,
        htmlAvailable,
        urlHtml,
        lastModified,
      ];

  static DateTime? _dateTimeFromJson(int? epoch) {
    if (epoch == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(epoch);
  }

  static int? _dateTimeToJson(DateTime? dateTime) {
    return dateTime?.millisecondsSinceEpoch;
  }
}
