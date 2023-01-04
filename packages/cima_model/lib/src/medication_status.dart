import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'medication_status.g.dart';

@JsonSerializable()
class MedicationStatus extends Equatable {
  MedicationStatus({
    this.authorizationDate,
    this.suspensionDate,
    this.revocationDate,
  });

  factory MedicationStatus.fromJson(Map<String, dynamic> json) =>
      _$MedicationStatusFromJson(json);

  @JsonKey(name: 'aut', fromJson: _fromJson, toJson: _toJson)
  final DateTime? authorizationDate;
  @JsonKey(name: 'susp', fromJson: _fromJson, toJson: _toJson)
  final DateTime? suspensionDate;
  @JsonKey(name: 'rev', fromJson: _fromJson, toJson: _toJson)
  final DateTime? revocationDate;

  Map<String, dynamic> toJson() => _$MedicationStatusToJson(this);

  @override
  List<Object?> get props => [
        authorizationDate,
        suspensionDate,
        revocationDate,
      ];

  static DateTime? _fromJson(int? epoch) =>
      epoch != null ? DateTime.fromMillisecondsSinceEpoch(epoch) : null;

  static int? _toJson(DateTime? dateTime) => dateTime?.millisecondsSinceEpoch;
}
