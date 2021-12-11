import 'package:equatable/equatable.dart';

abstract class Foto extends Equatable {
  Foto({this.tipo, this.url, this.fecha});

  final String? tipo;
  final String? url;
  final int? fecha;
}
