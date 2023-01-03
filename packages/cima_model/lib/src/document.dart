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
    this.url,
    required this.htmlAvailable,
    this.urlHtml,
    required this.lastModified,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  @JsonKey(name: 'tipo')
  final DocumentType type;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'secc', defaultValue: false)
  final bool htmlAvailable;
  final String? urlHtml;
  @JsonKey(name: 'fecha')
  final DateTime lastModified;

  Map<String, dynamic> toJson() => _$DocumentToJson(this);

  @override
  List<Object?> get props => [
        type,
        url,
        htmlAvailable,
        urlHtml,
        lastModified,
      ];
}
