import 'package:flutter/material.dart';
import 'package:job_app_ui/models/job_model.dart';

class GetData {
  final insterLogo =
      "https://static.vecteezy.com/system/resources/previews/014/414/683/non_2x/instagram-black-logo-on-transparent-background-free-vector.jpg";
  final uberLogo =
      "https://static.dezeen.com/uploads/2018/09/uber-rebrand-wolff-olins_dezeen_sq.jpg";
  final tiktokLogo =
      "https://cdn3.vectorstock.com/i/1000x1000/23/12/tik-tok-flat-icon-template-black-color-editable-vector-29632312.jpg";

  List<JobModel> getJobData() {
    List<JobModel> jobs = [
      JobModel(
        title: "Senior UX Designer",
        slary: "LKR 80,000",
        companyName: "Instagram",
        logo: insterLogo,
        city: "Colombo",
        time: "7 Days Left",
        primary: Colors.black,
        secondary: Colors.white,
      ),
      JobModel(
        title: "Senior UI Designer",
        slary: "LKR 80,000",
        companyName: "Instagram",
        logo: insterLogo,
        city: "Kandy",
        time: "7 Days Left",
        primary: Colors.black,
        secondary: Colors.white,
      ),
      JobModel(
        title: "Senior Mobile Developer",
        slary: "LKR 80,000",
        companyName: "Tiktok",
        logo: tiktokLogo,
        city: "Galle",
        time: "7 Days Left",
        primary: Colors.white,
        secondary: Colors.black,
      ),
      JobModel(
        title: "Senior Web Designer",
        slary: "LKR 80,000",
        companyName: "Uber",
        logo: uberLogo,
        city: "Colombo",
        time: "7 Days Left",
        primary: Colors.black,
        secondary: Colors.white,
      ),
    ];
    return jobs;
  }
}
