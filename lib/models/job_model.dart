import 'package:flutter/material.dart';

class JobModel {
  String title;
  String type;
  String slary;
  String companyName;
  String logo;
  String city;
  String time;
  Color primary;
  Color secondary;
  List<String> descriptionList;
  List<String> companyList;
  List<String> reviewList;

  JobModel({
    required this.title,
    this.type = "Full Time",
    required this.slary,
    required this.companyName,
    required this.logo,
    required this.city,
    required this.time,
    required this.primary,
    required this.secondary,
    this.descriptionList = const [],
    this.companyList = const [],
    this.reviewList = const [],
  });
}
