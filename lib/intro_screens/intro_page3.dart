import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Account",
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          color: Color(0xFFD2E6FF),
          child: Padding(
            padding: const EdgeInsets.only(top: 80,left: 40,right: 40),
            child: Column(
              children: [
                Text(
                  "Join us today by signing up to access our services",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
            Image.asset('assets/images/page3.png'),
            SizedBox(height: 20,),
            Image.asset('assets/images/page32.png'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
