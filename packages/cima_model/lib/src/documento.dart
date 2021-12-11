import 'package:equatable/equatable.dart';

abstract class Documento extends Equatable {
  Documento({this.tipo, this.url, this.secc});

  final int? tipo;
  final String? url;
  final bool? secc;
}
