import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_app_ui/services/get_data.dart';

class PupularJobsRaw extends StatelessWidget {
  const PupularJobsRaw({
    super.key,
    required this.data,
    required this.size,
  });

  final GetData data;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(data.getJobData().length, (index) {
          return JobCard(
            size: size,
            data: data,
            index: index,
          );
        }),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.size,
    required this.data,
    required this.index,
  });

  final Size size;
  final GetData data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: size.width * 0.7,
          height: 160,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: data.getJobData()[index].primary,
            borderRadius: BorderRadius.circular(15),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black
            //         .withOpacity(0.2), // Set the shadow color
            //     spreadRadius:
            //         1, // Set the spread radius of the shadow
            //     blurRadius:
            //         5, // Set the blur radius of the shadow
            //     offset: const Offset(
            //         4, 4), // Set the offset of the shadow
            //   ),
            // ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    data.getJobData()[index].title,
                    style: GoogleFonts.ubuntu(
                      color: data.getJobData()[index].secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.bookmark_add_rounded,
                    color: Colors.grey,
                  )
                ],
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
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      data.getJobData()[index].type,
                      style: TextStyle(
                        color: Colors.grey.shade300,
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
                          color: data.getJobData()[index].secondary,
                        ),
                        color: data.getJobData()[index].primary,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(data.getJobData()[index].logo),
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
    );
  }
}
