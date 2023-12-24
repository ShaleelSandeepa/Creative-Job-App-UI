import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_app_ui/services/get_data.dart';

class JobViewScreen extends StatefulWidget {
  const JobViewScreen({super.key});

  @override
  State<JobViewScreen> createState() => _JobViewScreenState();
}

class _JobViewScreenState extends State<JobViewScreen> {
  GetData data = GetData();
  final int index = 0;
  final tabButtons = ["Description", "Company", "Reviews"];
  int tabIndex = 0;
  List descriptionList = [
    "3+ years of experience with Automation framework development using Open-Source Tools like Selenium.",
    "Proficiency in at least one of the programing languages preferably Java/Java Script.",
    "Good understanding of Dev-ops/Cloud CI&CD concepts and tools like Jenkins.",
  ];
  List companyList = [
    "To interact with the customer and internal teams to gather requirements for development purposes.",
    "To maintain existing features, troubleshoot bugs, resolve ad-hoc requests and provide support for enhancement (major and minor) or new developments based on business or client requirements as well as from the functional and technical team of HCL on the project. ",
    "To perform activities related to enhancement creation of documents for CMMi and client requirements. ",
    "To provide technical guidance to junior developers."
  ];
  List reviewList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://cdn.dribbble.com/users/119436/screenshots/14091614/ssc-careers-illustration-vector-01b-02.png"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )),
            child: SafeArea(
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.7),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Material(
            elevation: 2,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Container(
              width: size.width,
              height: 160,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.getJobData()[index].title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          data.getJobData()[index].slary,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            data.getJobData()[index].type,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              color: data.getJobData()[index].primary,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image:
                                    NetworkImage(data.getJobData()[index].logo),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.getJobData()[index].companyName,
                              style: GoogleFonts.ubuntu(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data.getJobData()[index].city,
                              style: GoogleFonts.ubuntu(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          data.getJobData()[index].time,
                          style: GoogleFonts.ubuntu(
                            color: Colors.red,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: tabButtons.map((e) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      tabIndex = tabButtons.indexOf(e);
                    });
                  },
                  child: Chip(
                    backgroundColor: tabIndex == tabButtons.indexOf(e)
                        ? Colors.black
                        : Colors.white,
                    label: Text(
                      e,
                      style: TextStyle(
                        color: tabIndex == tabButtons.indexOf(e)
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          tabIndex == 0
              ? TabFragment(
                  list: descriptionList,
                  title: 'Qualifications',
                )
              : tabIndex == 1
                  ? TabFragment(
                      list: companyList,
                      title: 'About the company',
                    )
                  : TabFragment(
                      list: reviewList,
                      title: 'Feedbacks',
                    ),
        ],
      ),
    );
  }
}

class TabFragment extends StatelessWidget {
  const TabFragment({
    super.key,
    required this.list,
    required this.title,
  });

  final List list;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
      child: Container(
        constraints: BoxConstraints(
          // calculate remaining height
          maxHeight: (size.height * 0.75 - 240),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: List.generate(list.length, (index) {
                          return PointDetails(details: list[index]);
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PointDetails extends StatelessWidget {
  const PointDetails({
    super.key,
    required this.details,
  });

  final String details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 5),
            child: Icon(
              Icons.lens_rounded,
              size: 8,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                details,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
