import 'package:shamo/pages/materi/constant.dart';
import 'package:shamo/pages/materi/screens/course_library/course_library.dart';
import 'package:shamo/pages/materi/screens/home/home_screen.dart';
import 'package:shamo/pages/materi/screens/my_courses/my_courses.dart';
import 'package:shamo/pages/materi/widgets/custom_showdialog.dart';
import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

import 'package:shared_preferences/shared_preferences.dart';

class BottomNavigationWrapper extends StatefulWidget {
  const BottomNavigationWrapper({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationWrapper> createState() =>
      _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
  int index = 0;
  late PageController _pageController;
  late SharedPreferences preferences;
  late int currentTheme = -1;

  @override
  void initState() {
    // sharedPreferencesInitialization();
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future sharedPreferencesInitialization() async {
    preferences = await SharedPreferences.getInstance();
    int? getCurrentIndex = preferences.getInt("themeIndex");
    if (getCurrentIndex == null) {
      preferences.setInt("themeIndex", 0);
    }
    setState(() {
      currentTheme = getCurrentIndex!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: WillPopScope(
        onWillPop: () => CustomShowDialog().onWillPopExit(context),
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => this.index = index);
                },
                children: const <Widget>[
                  // QuizScreen(),

                  HomeScreen(),
                  // InitialQuizInstruction(),
                  // CourseContentScreen(),
                  // CourseLibrary(),
                  CourseLibrary(),
                  MyCourses(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
