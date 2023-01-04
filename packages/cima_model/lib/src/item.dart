import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item extends Equatable {
  Item({
    required this.id,
    this.code,
    this.name,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  /// Identificador alfanumérico del elemento
  @JsonKey(name: 'codigo')
  final String? code;

  /// Nombre del elemento
  @JsonKey(name: 'nombre')
  final String? name;

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  List<Object?> get props => [id, code, name];
}
