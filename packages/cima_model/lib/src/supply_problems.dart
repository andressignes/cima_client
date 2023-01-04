import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supply_problems.g.dart';

@JsonSerializable()
class SupplyProblems extends Equatable {
  SupplyProblems({
    required this.nationalCode,
    required this.name,
    this.start,
    this.end,
    required this.observations,
    required this.active,
  });

  factory SupplyProblems.fromJson(Map<String, dynamic> json) =>
      _$SupplyProblemsFromJson(json);

  @JsonKey(name: 'cn')
  final String nationalCode;
  @JsonKey(name: 'nombre')
  final String name;
  @JsonKey(name: 'fini', fromJson: _fromJson, toJson: _toJson)
  final DateTime? start;
  @JsonKey(name: 'ffin', fromJson: _fromJson, toJson: _toJson)
  final DateTime? end;
  @JsonKey(name: 'observ', defaultValue: '')
  final String observations;
  @JsonKey(name: 'activo')
  final bool active;

  Map<String, dynamic> toJson() => _$SupplyProblemsToJson(this);

  @override
  List<Object?> get props => [
        nationalCode,
        name,
        start,
        end,
        observations,
        active,
      ];

  static DateTime? _fromJson(int? value) {
    if (value == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(value);
  }

  static int? _toJson(DateTime? value) {
    if (value == null) return null;
    return value.millisecondsSinceEpoch;
  }
}
