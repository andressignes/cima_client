import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nota.g.dart';

@JsonSerializable()
class Nota extends Equatable {
  Nota(
      {this.tipo,
      this.num,
      this.referencia,
      this.asunto,
      this.fecha,
      this.url});

  factory Nota.fromJson(Map<String, dynamic> json) => _$NotaFromJson(json);

  final int? tipo;
  final String? num;
  final String? referencia;
  final String? asunto;
  final int? fecha;
  final String? url;

  Map<String, dynamic> toJson() => _$NotaToJson(this);

  @override
  List<Object?> get props => [tipo, num, referencia, asunto, fecha, url];
}
