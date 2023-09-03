import 'package:flutter/material.dart';

import '../models/app_user.dart';
import '../widgets/profile_menu.dart';

import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    var receiver = ModalRoute.of(context)?.settings.arguments as AppUser;
    final mediaQuery = MediaQuery.of(context);
    final scaffoldBodyHeight = mediaQuery.size.height -
        kToolbarHeight -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: scaffoldBodyHeight * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: scaffoldBodyHeight * .2,
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: receiver.id,
                    child: ClipOval(
                      child: receiver.profilePictureURL != null
                          ? FadeInImage(
                              fadeInDuration: const Duration(milliseconds: 300),
                              placeholder: const AssetImage(
                                  'assets/images/default_profile.png'),
                              image: NetworkImage(receiver.profilePictureURL!),
                              imageErrorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                      'assets/images/default_profile.png'),
                            )
                          : Image.asset('assets/images/default_profile.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  receiver.name,
                  style: TextStyle(
                    fontSize: 40,
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: scaffoldBodyHeight * .5,
            child: ProfileMenu(receiver: receiver),
          ),
        ],
      ),
    );
  }
}
