// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Job _$JobFromJson(Map<String, dynamic> json) {
  return Job(
      id: json['id'] as String,
      title: json['title'] as String,
      salary: json['salary'] as String,
      company: json['company'] as String,
      info: json['info'] as String,
      category: json['category'] as String,
      head: json['head'] as String,
      publish: json['publish'] as String);
}

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'salary': instance.salary,
      'company': instance.company,
      'info': instance.info,
      'category': instance.category,
      'head': instance.head,
      'publish': instance.publish
    };
