import 'package:equatable/equatable.dart';

abstract class Item extends Equatable {
  Item({this.id, this.codigo, this.nombre});

  final int? id;
  final String? codigo;
  final String? nombre;
}
