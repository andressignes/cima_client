import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'problema_suministro.g.dart';

@JsonSerializable()
class ProblemaSuministro extends Equatable {
  ProblemaSuministro({
    this.cn,
    this.nombre,
    this.tipoProblemaSuministro,
    this.fini,
    this.ffin,
    this.observ,
    this.activo,
  });

  factory ProblemaSuministro.fromJson(Map<String, dynamic> json) =>
      _$ProblemaSuministroFromJson(json);

  final String? cn;
  final String? nombre;
  final int? tipoProblemaSuministro;
  final int? fini;
  final int? ffin;
  final String? observ;
  final bool? activo;

  Map<String, dynamic> toJson() => _$ProblemaSuministroToJson(this);

  @override
  List<Object?> get props => [
        cn,
        nombre,
        tipoProblemaSuministro,
        fini,
        ffin,
        observ,
        activo,
      ];
}
