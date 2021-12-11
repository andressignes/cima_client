import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'foto.g.dart';

@JsonSerializable()
class Foto extends Equatable {
  Foto({this.tipo, this.url, this.fecha});
  factory Foto.fromJson(Map<String, dynamic> json) => _$FotoFromJson(json);

  final String? tipo;
  final String? url;
  final int? fecha;

  Map<String, dynamic> toJson() => _$FotoToJson(this);

  @override
  List<Object?> get props => [tipo, url, fecha];
}
