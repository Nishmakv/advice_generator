// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdviceModel _$AdviceModelFromJson(Map<String, dynamic> json) => AdviceModel(
      id: (json['id'] as num).toInt(),
      advice: json['advice'] as String,
    );

Map<String, dynamic> _$AdviceModelToJson(AdviceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'advice': instance.advice,
    };
