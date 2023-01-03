// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Excipient _$ExcipientFromJson(Map<String, dynamic> json) => Excipient(
      id: json['id'] as int,
      name: json['nombre'] as String,
      quantity: json['cantidad'] as String,
      unit: json['unidad'] as String,
      order: json['orden'] as int,
    );

Map<String, dynamic> _$ExcipientToJson(Excipient instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.name,
      'cantidad': instance.quantity,
      'unidad': instance.unit,
      'orden': instance.order,
    };
