import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  BaseModel();

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
  Map<String,dynamic> toJson() => _$BaseModelToJson(this);


  R stringToEnum<R>({
    @required List<R> enums,
    @required String stringVal,
  }) {
    final firstAlphaMatchTypes = [
      'ACTIVE',
      'DROP',
      'WITHDRAW',
    ];

    final val = enums.firstWhere((element) {
      final split = element.toString().split('.');

      if(firstAlphaMatchTypes.contains(R))
        return parsFirstAlphaMatch(strVal: stringVal, enumVal: split[1]);
      else
        throw Exception('no matching enum type found');
    });

    return val;
  }

  static bool parsFirstAlphaMatch({String strVal, String enumVal}) {
    return strVal == enumVal[0];
  }

}
