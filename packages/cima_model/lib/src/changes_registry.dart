import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'changes_registry.g.dart';

enum ChangeType {
  @JsonValue('1')
  created,
  @JsonValue('2')
  deleted,
  @JsonValue('3')
  updated,
}

@JsonSerializable()
class ChangesRegistry extends Equatable {
  ChangesRegistry({
    required this.registerNumber,
    required this.date,
    required this.type,
    required this.changes,
  });

  factory ChangesRegistry.fromJson(Map<String, dynamic> json) =>
      _$ChangesRegistryFromJson(json);

  @JsonKey(name: 'nregistro')
  final int registerNumber;

  @JsonKey(name: 'fecha')
  final DateTime date;

  @JsonKey(name: 'tipoCambio')
  final ChangeType type;

  @JsonKey(name: 'cambios')
  final List<String> changes;

  Map<String, dynamic> toJson() => _$ChangesRegistryToJson(this);

  @override
  List<Object?> get props => [registerNumber, date, type, changes];
}
