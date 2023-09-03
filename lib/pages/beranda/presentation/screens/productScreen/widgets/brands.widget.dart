import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/app/constants/app.assets.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/beranda/presentation/widgets/custom.text.style.dart';
import 'package:shamo/pages/beranda/presentation/widgets/dimensions.widget.dart';
import 'package:shamo/theme.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;

    List<String> categories = [
      "Video",
      "Artikel",
      "Quiz",
      "Telekonseling",
    ];
    List<String> categoriesImages = [
      AppAssets.video,
      AppAssets.artikel,
      AppAssets.quiz,
      AppAssets.telekonseling,
    ];

    showBrands(String text, String images) {
      return GestureDetector(
        onTap: () {
          String routeName;
          if (text == "Quiz") {
            routeName = '/quiz';
          } else if (text == "Video") {
            routeName = '/video';
          } else if (text == "Artikel") {
            routeName = '/articles';
          } else if (text == "Telekonseling") {
            routeName = '/chat';
          } else {
            return;
          }

          Navigator.pushNamed(context, routeName);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            elevation: 6,
            color: themeFlag ? AppColors.mirage : AppColors.creamColor,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor8,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: Image.asset(images),
                  ),
                  vSizedBox1,
                  Text(
                    text,
                    style: CustomTextWidget.bodyText2(
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Look Out On',
          style: CustomTextWidget.bodyTextB2(
            color: themeFlag ? AppColors.creamColor : AppColors.mirage,
          ),
        ),
        vSizedBox2,
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return showBrands(
                categories[index],
                categoriesImages[index],
              );
            },
          ),
        )
      ],
    );
  }
}
