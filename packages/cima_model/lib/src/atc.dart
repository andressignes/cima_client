import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'atc.g.dart';

@JsonSerializable()
class Atc extends Equatable {
  Atc({
    required this.code,
    required this.name,
    required this.level,
  });

  factory Atc.fromJson(Map<String, dynamic> json) => _$AtcFromJson(json);

  @JsonKey(name: 'codigo')
  final String code;
  @JsonKey(name: 'nombre')
  final String name;
  @JsonKey(name: 'nivel')
  final int level;

  Map<String, dynamic> toJson() => _$AtcToJson(this);

  @override
  List<Object?> get props => [code, name, level];
}
