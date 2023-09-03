import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      
      final User? user = FirebaseAuth.instance.currentUser;
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgroundColor3,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            color: backgroundColor8,
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/image_profile.png',
                    width: 64,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, ${user?.displayName ?? 'Guest'}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: semiBold,
                          overflow: TextOverflow.ellipsis,
                          color: backgroundColor4
                        ),
                      ),
                      Text(
                        '${user?.email}',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          color: backgroundColor4
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/sign-in',
                      (route) => false,
                    );
                  },
                  child: Image.asset(
                    'assets/images/button_exit.png',
                    width: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }

    Widget menuSegment(String segmentName) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          segmentName,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
            color: backgroundColor9
          ),
        ),
      );
    }

    Widget menuItem(String menuName) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              menuName,
              style: subtitleTextStyle.copyWith(
                fontSize: 13,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: subtitleColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menuSegment('Account'),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                child: menuItem('Edit Profile'),
              ),
              menuItem('Help'),
              menuSegment('General'),
              menuItem('Privacy & Policy'),
              menuItem('Term of Service'),
              menuItem('Rate App'),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
