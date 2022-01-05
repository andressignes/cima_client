import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'descripcion_clinica.g.dart';

@JsonSerializable()
class DescripcionClinica extends Equatable {
  DescripcionClinica(
      {this.vmp, this.vmpDesc, this.vmpp, this.vmppDesc, this.presComerc});

  factory DescripcionClinica.fromJson(Map<String, dynamic> json) =>
      _$DescripcionClinicaFromJson(json);

  final String? vmp;
  final String? vmpDesc;
  final String? vmpp;
  final String? vmppDesc;
  final int? presComerc;

  Map<String, dynamic> toJson() => _$DescripcionClinicaToJson(this);

  @override
  List<Object?> get props => [
        vmp,
        vmpDesc,
        vmpp,
        vmppDesc,
        presComerc,
      ];
}
