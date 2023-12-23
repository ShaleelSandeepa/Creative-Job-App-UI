import 'package:flutter/material.dart';
import 'package:job_app_ui/models/job_model.dart';

class GetData {
  final insterLogo =
      "https://static.vecteezy.com/system/resources/previews/014/414/683/non_2x/instagram-black-logo-on-transparent-background-free-vector.jpg";
  final uberLogo =
      "https://static.dezeen.com/uploads/2018/09/uber-rebrand-wolff-olins_dezeen_sq.jpg";
  final whatsappLogo =
      "https://i.pinimg.com/originals/cb/bf/c7/cbbfc7f9d8cd2d8a70f4be570f177616.jpg";
  final linkedinLogo =
      "https://static.vecteezy.com/system/resources/previews/018/910/809/original/linkedin-logo-linkedin-symbol-linkedin-icon-free-free-vector.jpg";

  List<JobModel> getJobData() {
    List<JobModel> jobs = [
      JobModel(
        title: "Senior UX Designer",
        slary: "LKR 80,000 /month",
        companyName: "Instagram",
        logo: insterLogo,
        city: "Colombo",
        time: "7 Days Left",
        primary: Colors.black,
        secondary: Colors.white,
      ),
      JobModel(
        title: "Senior Mobile Developer",
        slary: "LKR 80,000 /month",
        companyName: "Whatsapp",
        logo: whatsappLogo,
        city: "Galle",
        time: "7 Days Left",
        primary: Colors.white,
        secondary: Colors.black,
      ),
      JobModel(
        title: "Senior UI Designer",
        slary: "LKR 80,000 /month",
        companyName: "Linkedin",
        logo: linkedinLogo,
        city: "Kandy",
        time: "7 Days Left",
        primary: Colors.black,
        secondary: Colors.white,
      ),
      JobModel(
        title: "Senior Web Designer",
        slary: "LKR 80,000 /month",
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
