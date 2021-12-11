import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'documento.g.dart';

@JsonSerializable()
class Documento extends Equatable {
  Documento({this.tipo, this.url, this.secc});

  factory Documento.fromJson(Map<String, dynamic> json) =>
      _$DocumentoFromJson(json);

  final int? tipo;
  final String? url;
  final bool? secc;

  Map<String, dynamic> toJson() => _$DocumentoToJson(this);

  @override
  List<Object?> get props => [tipo, url, secc];
}
