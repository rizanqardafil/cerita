import 'package:flutter/material.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';
import 'package:shamo/pages/beranda/presentation/widgets/custom.text.style.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.90,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
          Text(
            title,
            style: CustomTextWidget.bodyText2(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
        ],
      ),
    );
  }
}
