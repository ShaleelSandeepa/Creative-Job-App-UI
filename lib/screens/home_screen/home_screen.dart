import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_app_ui/screens/home_screen/widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Good Morning Alexa",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Find Your\nCreative Job",
                style: GoogleFonts.ubuntu(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.75,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search For Jobs",
                        hintStyle: const TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.125,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Jobs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Show all",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width: size.width * 0.65,
                          height: 175,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.black,
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
                                    "Senior UX Designer",
                                    style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.bookmark_add_rounded,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
