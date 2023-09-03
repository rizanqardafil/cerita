import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/lib/app/constants/app.assets.dart';
import 'package:shamo/pages/lib/app/constants/app.colors.dart';
import 'package:shamo/pages/lib/app/routes/app.routes.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/lib/presentation/screens/categoryScreen/category.screen.dart';
import 'package:shamo/pages/lib/presentation/widgets/custom.text.style.dart';
import 'package:shamo/pages/lib/presentation/widgets/dimensions.widget.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;

    List<String> categories = [
      "Jordan's",
      "Adidas",
      "Puma",
      "Reebok",
      "Nike",
    ];
    List<String> categoriesImages = [
      AppAssets.brandJordan,
      AppAssets.brandAdidas,
      AppAssets.brandPuma,
      AppAssets.brandReebok,
      AppAssets.brandNike
    ];

    showBrands(String text, String images) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRouter.categoryRoute,
            arguments: CategoryScreenArgs(categoryName: text),
          );
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
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Image.network(images),
                ),
                vSizedBox1,
                Text(
                  text,
                  style: CustomTextWidget.bodyText2(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                )
              ],
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
          'Brands We Have',
          style: CustomTextWidget.bodyTextB2(
            color: themeFlag ? AppColors.creamColor : AppColors.mirage,
          ),
        ),
        vSizedBox2,
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.20,
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
