import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'documento.g.dart';

enum TipoDocumento {
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
class Documento extends Equatable {
  Documento({required this.tipo, this.url, this.secc});

  factory Documento.fromJson(Map<String, dynamic> json) =>
      _$DocumentoFromJson(json);

  final TipoDocumento tipo;
  final String? url;
  final bool? secc;

  Map<String, dynamic> toJson() => _$DocumentoToJson(this);

  @override
  List<Object?> get props => [tipo, url, secc];
}
