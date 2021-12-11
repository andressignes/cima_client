import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  Item({this.id, this.codigo, this.nombre});
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  final int? id;
  final String? codigo;
  final String? nombre;

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  List<Object?> get props => [id, codigo, nombre];
}
