import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'atc.g.dart';

@JsonSerializable()
class Atc extends Equatable {
  Atc({this.codigo, this.nombre, this.nivel});

  factory Atc.fromJson(Map<String, dynamic> json) => _$AtcFromJson(json);

  final String? codigo;
  final String? nombre;
  final int? nivel;

  Map<String, dynamic> toJson() => _$AtcToJson(this);

  @override
  List<Object?> get props => [codigo, nombre, nivel];
}
