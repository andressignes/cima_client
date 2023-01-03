import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_section.g.dart';

@JsonSerializable()
class DocumentSection extends Equatable {
  DocumentSection({this.section, this.title, this.order, this.body});

  factory DocumentSection.fromJson(Map<String, dynamic> json) =>
      _$DocumentSectionFromJson(json);

  @JsonKey(name: 'seccion')
  final String? section;
  @JsonKey(name: 'titulo')
  final String? title;
  @JsonKey(name: 'orden')
  final int? order;
  @JsonKey(name: 'contenido')
  final String? body;

  Map<String, dynamic> toJson() => _$DocumentSectionToJson(this);

  @override
  List<Object?> get props => [section, title, order, body];
}
