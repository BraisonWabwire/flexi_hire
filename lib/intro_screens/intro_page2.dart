import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(title: Text('Flexi Hire', style: GoogleFonts.roboto(
          fontSize: 25,
          wordSpacing:1.2,
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold
        ),),),
        body: DecoratedBox(
          decoration:BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )
            ),
          child: Column(
            children: [
              Text(
                  "Find your preffered job with just a click",
                  style:  GoogleFonts.montserrat(
                    fontSize: 30,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        )
      ),
    );
  }
}
