import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'general_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, nullable: false)
class ListResponseModelData<T> {
  final String resultCode;
  final List<T> values;

  ListResponseModelData({
    @required this.resultCode,
    @required this.values
  });

  factory ListResponseModelData.fromJson(Map<String, dynamic> json,
      T Function(Object json) fromJsonT) =>
      _$ListResponseModelDataFromJson(json, fromJsonT);


  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ListResponseModelDataToJson(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true, nullable: false)
class ListResponseModel<T> {
  final String resultCode;
  final ListResponseModelData<T> data;

  ListResponseModel({
    @required this.resultCode,
    @required this.data,
  });

  factory ListResponseModel.fromJson(
      Map<String, dynamic> json, T Function(Object json) fromJsonT) =>
      _$ListResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ListResponseModelToJson(this, toJsonT);

  get isSuccess {
    return this.resultCode == 'SUCCESS';
  }
}