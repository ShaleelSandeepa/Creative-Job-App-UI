import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Icon(Icons.space_dashboard),
          ),
          SizedBox(
            height: 50,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // create gradient color for App title
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      colors: [Colors.black, Colors.blue],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ).createShader(bounds);
                  },
                  child: Text(
                    "Job",
                    style: GoogleFonts.righteous(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Set a default color for the text
                      height: 0.8,
                    ),
                  ),
                ),
                Text(
                  "Creative",
                  style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2021/04/14/16/02/beauty-6178763_960_720.jpg"))),
          )
        ],
      ),
    );
  }
}
