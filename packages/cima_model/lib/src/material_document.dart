import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'material_document.g.dart';

/// Contiene la información relativa a los documentos asociados a un medicamento
@JsonSerializable()
class MaterialDocument extends Equatable {
  MaterialDocument({
    required this.name,
    required this.url,
    required this.lastUpdate,
    this.isVideo,
  });

  factory MaterialDocument.fromJson(Map<String, dynamic> json) =>
      _$MaterialDocumentFromJson(json);

  @JsonKey(name: 'nombre')
  final String name;
  @JsonKey(name: 'url')
  final Uri url;
  @JsonKey(
    name: 'fecha',
    fromJson: _dateTimeFromEpoch,
    toJson: _dateTimeToEpoch,
  )
  final DateTime lastUpdate;

  @JsonKey(name: 'video')
  final bool? isVideo;

  Map<String, dynamic> toJson() => _$MaterialDocumentToJson(this);

  @override
  List<Object?> get props => [name, url, lastUpdate, isVideo];

  static DateTime _dateTimeFromEpoch(int epoch) =>
      DateTime.fromMillisecondsSinceEpoch(epoch);

  static int _dateTimeToEpoch(DateTime dateTime) =>
      dateTime.millisecondsSinceEpoch;
}
