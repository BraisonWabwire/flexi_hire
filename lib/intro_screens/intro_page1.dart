import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flexi Hire', style: GoogleFonts.roboto(
        fontSize: 30,
        wordSpacing:1.2,
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold
      ),),),
      body: Container(
      color: Colors.white,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.deepPurple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Text(
                "Flexi Hire, Kenya's top job finder platform",
                style:  GoogleFonts.montserrat(
                  fontSize: 20,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset('assets/images/working.png'),
        ],
      ),
    ),
    );
  }
}
