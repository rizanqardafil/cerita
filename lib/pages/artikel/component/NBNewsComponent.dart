import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shamo/pages/artikel/model/NBModel.dart';
import 'package:shamo/pages/artikel/screen/NBNewsDetailsScreen.dart';
import 'package:shamo/pages/artikel/utils/NBColors.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';
import 'package:shamo/pages/app_styles.dart';

class NBNewsComponent extends StatefulWidget {
  static String tag = '/NBNewsComponent';
  final List<NBNewsDetailsModel>? list;

  const NBNewsComponent({super.key, this.list});

  @override
  NBNewsComponentState createState() => NBNewsComponentState();
}

class NBNewsComponentState extends State<NBNewsComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    return ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: widget.list!.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        NBNewsDetailsModel mData = widget.list![index];
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        mData.image ??
                            'default_image_path.png', // Use a default image path if mData.image is null
                      ), // Use the image from mData.image
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('${mData.categoryName}',
                    style: boldTextStyle(
                        color: themeFlag
                            ? AppColors.creamColor
                            : AppColors.mirage)),
                Text('${mData.title}',
                    style: boldTextStyle(
                        color: themeFlag
                            ? AppColors.creamColor
                            : AppColors.mirage), softWrap: true, maxLines: 3),
                8.height,
                Text('${mData.date}', style: secondaryTextStyle()),
              ],
            ).expand(flex: 2),
            4.width,
          ],
        ).onTap(() {
          NBNewsDetailsScreen(newsDetails: mData).launch(context);
        });
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
