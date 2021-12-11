import 'package:equatable/equatable.dart';

abstract class Nota extends Equatable {
  Nota({this.tipo, this.num, this.ref, this.asunto, this.fecha, this.url});

  final int? tipo;
  final String? num;
  final String? ref;
  final String? asunto;
  final int? fecha;
  final String? url;
}
