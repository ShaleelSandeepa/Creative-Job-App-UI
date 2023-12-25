import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_app_ui/models/job_model.dart';
import 'package:job_app_ui/services/get_data.dart';

class JobViewScreen extends StatefulWidget {
  const JobViewScreen({super.key, required this.model});

  final JobModel model;

  @override
  State<JobViewScreen> createState() => _JobViewScreenState();
}

class _JobViewScreenState extends State<JobViewScreen> {
  GetData data = GetData();
  final int index = 0;
  final tabButtons = ["Description", "Company", "Reviews"];
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Stack(
          children: [
            Column(
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.7),
                            child: const Icon(
                              Icons.arrow_back_rounded,
                            ),
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
                            widget.model.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.model.slary,
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
                                  widget.model.type,
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
                                    color: widget.model.primary,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(widget.model.logo),
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
                                    widget.model.companyName,
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.model.city,
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                widget.model.time,
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
                  padding: const EdgeInsets.only(
                      top: 15, left: 10, right: 10, bottom: 5),
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
                        list: widget.model.descriptionList,
                        title: 'Qualifications',
                      )
                    : tabIndex == 1
                        ? TabFragment(
                            list: widget.model.companyList,
                            title: 'About the company',
                          )
                        : TabFragment(
                            list: widget.model.reviewList,
                            title: 'Feedbacks',
                          ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 0),
                      blurRadius: 8,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.normal,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey.shade500)),
                      child: const Icon(Icons.bookmarks_rounded),
                    ),
                    Container(
                      width: size.width * 0.7,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Apply Now",
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class TabFragment extends StatelessWidget {
  const TabFragment({
    super.key,
    required this.list,
    required this.title,
  });

  final List<String>? list;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: Container(
        constraints: BoxConstraints(
          // calculate remaining height
          maxHeight: (size.height * 0.75 - 340),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                          children: List.generate(list!.length, (index) {
                            return PointDetails(details: list![index]);
                          }),
                        ),
                      ],
                    ),
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
