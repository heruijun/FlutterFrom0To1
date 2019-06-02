import 'package:json_annotation/json_annotation.dart';

part 'company_detail.g.dart';

@JsonSerializable()

class CompanyDetail {
  final String id;
  final String inc;
  final List companyImgsResult;

  CompanyDetail({this.id, this.inc, this.companyImgsResult});

  factory CompanyDetail.fromJson(Map<String, dynamic> json) => _$CompanyDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyDetailToJson(this);

}