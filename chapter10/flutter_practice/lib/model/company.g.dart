// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
      id: json['id'] as String,
      company: json['company'] as String,
      logo: json['logo'] as String,
      info: json['info'] as String,
      hot: json['hot'] as String);
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'logo': instance.logo,
      'info': instance.info,
      'hot': instance.hot
    };
