import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //         // Do something
      //         },
      //         child: Icon(Icons.arrow_back),
      //       ),
      //     ],
      //   ),
      // ),

      body: Container(
      color: Colors.white,
      child: Scaffold(appBar: AppBar(title: Text(
                  "Welcome",
                  style:  GoogleFonts.montserrat(
                  fontSize: 20,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),)),
    ),
    );
  }
}


