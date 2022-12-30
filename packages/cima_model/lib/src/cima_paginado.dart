import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cima_paginado.g.dart';

@JsonSerializable()
class CimaPaginado extends Equatable {
  CimaPaginado(
      {this.totalFilas, this.pagina, this.tamanioPagina, this.resultados});

  factory CimaPaginado.fromJson(Map<String, dynamic> json) =>
      _$CimaPaginadoFromJson(json);

  final int? totalFilas;
  final int? pagina;
  final int? tamanioPagina;
  final List? resultados;

  Map<String, dynamic> toJson() => _$CimaPaginadoToJson(this);

  @override
  List<Object?> get props => [
        totalFilas,
        pagina,
        tamanioPagina,
        resultados,
      ];
}
