import 'package:flutter/material.dart';
import 'package:shamo/onboarding/onboarding.dart';
import 'package:shamo/onboarding/controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final page = Controller();
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page! < page.pageList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, '/welcome'); // Navigate to "/sign-in" screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: page.pageList.length,
      itemBuilder: (context, index) {
        return Onboarding(
          topText: index == page.pageList.length - 1
              ? 'Skip'
              : 'Skip', // Change the text based on the last page
          imagePath: page.pageList[index].imagePath,
          title: page.pageList[index].title,
          subTitle: page.pageList[index].subTitle,
          buttonTitle: index == page.pageList.length - 1 ? 'Finish' : 'Next',
          buttonIcon: Icons.arrow_forward_rounded,
          iconColor: Colors.white,
          buttonColor: const Color(0xff4756DF),
          buttonTextColor: Colors.white,
          onPressed: _nextPage,
          onSkip: () {
            Navigator.pushNamed(
                context, '/welcome'); // Navigate to "/sign-in" screen
          },
        );
      },
    );
  }
}
