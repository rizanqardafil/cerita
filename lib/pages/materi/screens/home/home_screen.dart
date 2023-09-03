import 'package:shamo/pages/materi/screens/course_library/components/course_list_tile.dart';
import 'package:shamo/pages/materi/screens/home/components/navbar.dart';
import 'package:shamo/pages/materi/screens/home/components/trending_course.dart';
import 'package:shamo/pages/materi/screens/my_courses/my_courses.dart';
import 'package:shamo/pages/materi/screens/course_library/course_library.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';
import 'package:shamo/pages/beranda/presentation/widgets/custom.text.style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String name = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NavBar(name: name),
            const SizedBox(height: 65.0),
            CourseTrending(
              onPressed: () {
                print("Course Button is Pressed");
              },
              isNew: true,
              imagePath: "assets/images/header_video.png",
              title: "Courses",
              isPremium: true,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  const TitleText(titleText: "Recent Course"),
                  CourseListTile(
                    imageURL: "assets/images/mycourses.png",
                    title: "My Courses",
                    description:
                        "Work Hard, Develop Skills and Solve Problems.",
                    buttonText: "My COURSES",
                    isAlreadyEnrolled: false,
                    isMyCourseSection: false,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            backgroundColor: backgroundColor8,
                            body: const MyCourses(),
                          ),
                        ),
                      );
                    },
                    isInfo: false,
                    onInfo: () {},
                  ),
                  const SizedBox(height: 30.0),
                  const TitleText(titleText: "Recommended"),
                  CourseListTile(
                    imageURL: "assets/images/allcourses.png",
                    title: "Courses",
                    description:
                        "Work Hard, Develop Skills and Solve Problems.",
                    buttonText: "All COURSES",
                    isAlreadyEnrolled: false,
                    isMyCourseSection: false,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            backgroundColor: backgroundColor4,
                            body: const CourseLibrary(),
                          ),
                        ),
                      );
                    },
                    isInfo: false,
                    onInfo: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.titleText,
  }) : super(key: key);
  final String titleText;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        titleText,
        style: CustomTextWidget.bodyText3(
          color: themeFlag ? AppColors.creamColor : AppColors.mirage,
        ),
      ),
    );
  }
}
