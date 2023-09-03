import 'package:flutter/material.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';
import 'package:shamo/pages/beranda/presentation/widgets/custom.text.style.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    return Row(
      children: <Widget>[
        Text(
          title,
          style: CustomTextWidget.bodyText3(
            color: themeFlag ? AppColors.creamColor : AppColors.mirage,
          ),
        ),
      ],
    );
  }
}
