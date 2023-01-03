import 'package:cima_model/src/medication_status.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'presentation.g.dart';

@JsonSerializable()
class Presentation extends Equatable {
  Presentation({
    required this.nationalCode,
    required this.name,
    required this.status,
    required this.haveSupplyProblems,
    required this.isCommercialized,
  });

  factory Presentation.fromJson(Map<String, dynamic> json) =>
      _$PresentationFromJson(json);

  @JsonKey(name: 'cn')
  final String nationalCode;
  @JsonKey(name: 'nombre')
  final String name;
  @JsonKey(name: 'estado')
  final MedicationStatus status;
  @JsonKey(name: 'comerc')
  final bool isCommercialized;
  @JsonKey(name: 'psum')
  final bool haveSupplyProblems;

  Map<String, dynamic> toJson() => _$PresentationToJson(this);

  @override
  List<Object?> get props => [
        nationalCode,
        name,
        status,
        isCommercialized,
        haveSupplyProblems,
      ];
}
