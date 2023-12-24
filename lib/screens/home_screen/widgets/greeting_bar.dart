import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingBar extends StatelessWidget {
  const GreetingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}