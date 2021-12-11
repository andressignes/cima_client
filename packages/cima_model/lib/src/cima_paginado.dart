import 'package:equatable/equatable.dart';

abstract class CimaPaginado extends Equatable {
  CimaPaginado(
      {this.totalFilas, this.pagina, this.tamanioPagina, this.resultados});

  final int? totalFilas;
  final int? pagina;
  final int? tamanioPagina;
  final List? resultados;
}
