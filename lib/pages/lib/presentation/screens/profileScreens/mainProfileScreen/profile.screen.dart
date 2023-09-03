import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamo/pages/lib/app/constants/app.colors.dart';
import 'package:shamo/pages/lib/app/constants/app.keys.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/beranda/core/notifiers/user.notifier.dart';
import 'package:shamo/pages/lib/core/utils/snackbar.util.dart';
import 'package:shamo/pages/lib/presentation/widgets/custom.back.btn.dart';
import 'package:shamo/pages/lib/presentation/widgets/custom.text.style.dart';
import 'package:shamo/pages/lib/presentation/widgets/dimensions.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamo/theme.dart';

class ProfileScreenn extends StatelessWidget {
  const ProfileScreenn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;

    final User? user = FirebaseAuth.instance.currentUser;
    final String? userName = user?.displayName;

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: Column(
          children: [
            Row(
              children: [
                CustomBackButton(
                  route: '/home',
                  themeFlag: themeFlag,
                ),
                Text(
                  'Profile',
                  style: CustomTextWidget.bodyTextB2(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                ),
              ],
            ),
            vSizedBox1,
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _createAccountInformation(
                      context: context,
                      themeFlag: themeFlag,
                      userName: userName),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pushNamed(context, '/editProfile');
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Update Info',
                            style: TextStyle(
                              fontSize: 15,
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pushNamed(context, '/changePassword');
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 15,
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pushNamed(context, '/appSettings');
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 15,
                              color: themeFlag
                                  ? AppColors.creamColor
                                  : AppColors.mirage,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: themeFlag
                                ? AppColors.creamColor
                                : AppColors.mirage,
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createAccountInformation({
    required BuildContext context,
    required bool themeFlag,
    required String? userName,
  }) {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    final User? userName = FirebaseAuth.instance.currentUser;
    final double profilePictureSize = MediaQuery.of(context).size.width / 4;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: profilePictureSize,
            height: profilePictureSize,
            child: GestureDetector(
              onTap: () {
                if (userName == null) {
                  SnackUtil.stylishSnackBar(
                      text: 'Session Timeout', context: context);
                  Navigator.pushReplacementNamed(context, '/login');
                  DeleteCache.deleteKey(AppKeys.userData);
                } else {
                  Navigator.pushNamed(context, '/accountInfo');
                }
              },
              child: CircleAvatar(
                backgroundColor:
                    themeFlag ? AppColors.creamColor : AppColors.mirage,
                radius: profilePictureSize - 4,
                child: Hero(
                  tag: 'profilePicture',
                  child: ClipOval(
                    child: SvgPicture.network(
                      'https://avatars.dicebear.com/api/big-smile/$userName.svg',
                      semanticsLabel: 'A shark?!',
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
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
                  'Hallo, ${userName?.displayName ?? 'Guest'}',
                  style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                      overflow: TextOverflow.ellipsis,
                      color: backgroundColor4),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    if (userName == true) {
                      SnackUtil.stylishSnackBar(
                          text: 'Session Timeout', context: context);
                      Navigator.pushReplacementNamed(context, '/login');
                      DeleteCache.deleteKey(AppKeys.userData);
                    } else {
                      Navigator.pushNamed(context, '/accountInfo');
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        'Account Information',
                        style: TextStyle(
                          fontSize: 14,
                          color: themeFlag
                              ? AppColors.creamColor
                              : AppColors.mirage,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
