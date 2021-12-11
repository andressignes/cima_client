import 'package:equatable/equatable.dart';

abstract class DocumentoMaterial extends Equatable {
  DocumentoMaterial({this.nombre, this.url, this.fecha});

  final String? nombre;
  final String? url;
  final int? fecha;
}
