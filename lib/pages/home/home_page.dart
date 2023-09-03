import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamo/pages/beranda/presentation/screens/productScreen/widgets/brands.widget.dart';
import 'package:shamo/pages/beranda/presentation/screens/productScreen/widgets/home.widget.dart';
import 'package:shamo/pages/beranda/presentation/widgets/custom.text.style.dart';
import 'package:shamo/pages/beranda/presentation/widgets/dimensions.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;

    final User? user = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi , ${user?.displayName ?? 'Guest'}',
                      style: CustomTextWidget.bodyTextB1(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      ),
                    ),
                    vSizedBox1,
                    Text(
                      'Welcome Back!',
                      style: CustomTextWidget.bodyText3(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      ),
                    ),
                    vSizedBox2,
                    const HomeWidget(),
                    const BrandWidget(),
                    vSizedBox2,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
