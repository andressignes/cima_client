import 'package:equatable/equatable.dart';

abstract class ProblemaSuministro extends Equatable{
  final String? cn;
  final String? nombre;
  final int? fini;
  final int? ffin;
  final String? observ;
  final bool? activo;

  ProblemaSuministro(
      {this.cn, this.nombre, this.fini, this.ffin, this.observ, this.activo});
}
