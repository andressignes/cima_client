// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationStatus _$MedicationStatusFromJson(Map<String, dynamic> json) =>
    MedicationStatus(
      authorizationDate: MedicationStatus._fromJson(json['aut'] as int?),
      suspensionDate: MedicationStatus._fromJson(json['susp'] as int?),
      revocationDate: MedicationStatus._fromJson(json['rev'] as int?),
    );

Map<String, dynamic> _$MedicationStatusToJson(MedicationStatus instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('aut', MedicationStatus._toJson(instance.authorizationDate));
  writeNotNull('susp', MedicationStatus._toJson(instance.suspensionDate));
  writeNotNull('rev', MedicationStatus._toJson(instance.revocationDate));
  return val;
}
