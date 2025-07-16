import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Search for job',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              wordSpacing: 1.2,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text(
                      "Find your preffered job with just a click",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/searching.png'),
            DecoratedBox(
              decoration:BoxDecoration(
                // color: Colors.deepPurpleAccent
              ), 
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.card_membership,
                      size: 60,
                      color: Colors.deepPurpleAccent,
                    ),
                     Text(
                      "Get verified today",
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              )
          ],
        ),
      ),
    );
  }
}
