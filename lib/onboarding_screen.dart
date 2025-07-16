import 'package:flexi_hire/intro_screens/intro_page1.dart';
import 'package:flexi_hire/intro_screens/intro_page2.dart';
import 'package:flexi_hire/intro_screens/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // _controller keep track of the page we are on
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
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
                  child: Text('skip'),
                ),
                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3),

                // next or done
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text('next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
