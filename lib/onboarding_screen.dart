import 'package:flexi_hire/homepage.dart';
import 'package:flexi_hire/intro_screens/intro_page1.dart';
import 'package:flexi_hire/intro_screens/intro_page2.dart';
import 'package:flexi_hire/intro_screens/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // _controller keep track of the page we are on
  final PageController _controller = PageController();

  // Keep track if we are in the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [IntroPage1(), IntroPage2(), IntroPage3()],
          ),

          Container(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text('skip', style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                // next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        },
                        child: Text('done',style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text('next',style: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
