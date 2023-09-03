import 'package:shamo/pages/materi/screens/home/bottom_navigation_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  Future<bool> checkAndNavigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name = preferences.getString("name");
    if (name == null) {
      return true; // register
    } else {
      return false; // home
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkAndNavigate(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return const BottomNavigationWrapper();
          } else {
            return const BottomNavigationWrapper();
          }
        }
        return Container();
      }),
    );
  }
}
