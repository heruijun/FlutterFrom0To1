// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDetail _$CompanyDetailFromJson(Map<String, dynamic> json) {
  return CompanyDetail(
      id: json['id'] as String,
      inc: json['inc'] as String,
      companyImgsResult: json['companyImgsResult'] as List);
}

Map<String, dynamic> _$CompanyDetailToJson(CompanyDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inc': instance.inc,
      'companyImgsResult': instance.companyImgsResult
    };
