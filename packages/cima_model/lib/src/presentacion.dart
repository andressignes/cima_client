import 'package:equatable/equatable.dart';

import 'estado.dart';

abstract class Presentacion extends Equatable {
  Presentacion({this.cn, this.nombre, this.estado, this.comerc, this.psum});

  final String? cn;
  final String? nombre;
  final Estado? estado;
  final bool? comerc;
  final bool? psum;
}
