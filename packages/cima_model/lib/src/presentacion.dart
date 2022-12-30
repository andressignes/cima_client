import 'package:cima_model/src/estado.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentacion.g.dart';

@JsonSerializable()
class Presentacion extends Equatable {
  Presentacion({this.cn, this.nombre, this.estado, this.comerc, this.psum});

  factory Presentacion.fromJson(Map<String, dynamic> json) =>
      _$PresentacionFromJson(json);

  final String? cn;
  final String? nombre;
  final Estado? estado;
  final bool? comerc;
  final bool? psum;

  Map<String, dynamic> toJson() => _$PresentacionToJson(this);

  @override
  List<Object?> get props => [cn, nombre, estado, comerc, psum];
}
