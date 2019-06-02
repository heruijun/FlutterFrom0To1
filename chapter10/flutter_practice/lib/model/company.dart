import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()

class Company {
  final String id;
  final String company;
  final String logo;
  final String info;
  final String hot;

  Company({this.id, this.company, this.logo, this.info, this.hot});

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}