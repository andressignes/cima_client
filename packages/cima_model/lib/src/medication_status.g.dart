// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationStatus _$MedicationStatusFromJson(Map<String, dynamic> json) =>
    MedicationStatus(
      authorizationDate:
          json['aut'] == null ? null : DateTime.parse(json['aut'] as String),
      suspensionDate:
          json['susp'] == null ? null : DateTime.parse(json['susp'] as String),
      revocationDate:
          json['rev'] == null ? null : DateTime.parse(json['rev'] as String),
    );

Map<String, dynamic> _$MedicationStatusToJson(MedicationStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('aut', instance.authorizationDate?.toIso8601String());
  writeNotNull('susp', instance.suspensionDate?.toIso8601String());
  writeNotNull('rev', instance.revocationDate?.toIso8601String());
  return val;
}
