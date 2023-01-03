import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'excipient.g.dart';

@JsonSerializable()
class Excipient extends Equatable {
  Excipient({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.order,
  });

  factory Excipient.fromJson(Map<String, dynamic> json) =>
      _$ExcipientFromJson(json);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'nombre')
  final String name;
  @JsonKey(name: 'cantidad')
  final String quantity;
  @JsonKey(name: 'unidad')
  final String unit;
  @JsonKey(name: 'orden')
  final int order;

  Map<String, dynamic> toJson() => _$ExcipientToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        quantity,
        unit,
        order,
      ];
}
