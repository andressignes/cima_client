import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'estado.g.dart';

@JsonSerializable()
class Estado extends Equatable {
  Estado({this.aut, this.susp, this.rev});

  factory Estado.fromJson(Map<String, dynamic> json) => _$EstadoFromJson(json);

  final int? aut;
  final int? susp;
  final int? rev;

  Map<String, dynamic> toJson() => _$EstadoToJson(this);

  @override
  List<Object?> get props => [aut, susp, rev];
}
