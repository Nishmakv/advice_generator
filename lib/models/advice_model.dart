import 'package:json_annotation/json_annotation.dart';
part 'advice_model.g.dart';

@JsonSerializable()
class AdviceModel {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'advice')
  final String advice;

  AdviceModel({
    required this.id,
    required this.advice,
  });

  factory AdviceModel.fromJson(Map<String, dynamic> json) =>
      _$AdviceModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdviceModelToJson(this);
}
