import 'package:flutter/material.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/theme.dart';
import 'package:shamo/pages/lib/presentation/screens/profileScreens/mainProfileScreen/profile.screen.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/lib/app/constants/app.colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;

    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/chat');
        },
        backgroundColor: backgroundColor8,
        child: Image.asset(
          'assets/images/bubble-chat.png',
          width: 30,
          color: backgroundColor4,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor10,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentPage,
            onTap: (value) {
              setState(() {
                currentPage = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/images/icon_home.png',
                    width: 21,
                    color: currentPage == 0 ? primaryColor : thirdColor,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: Image.asset(
                    'assets/images/icon_profile.png',
                    width: 18,
                    color: currentPage == 1 ? primaryColor : thirdColor,
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (currentPage) {
        case 0:
          return const HomePage();
        case 1:
          return const ProfileScreenn();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
