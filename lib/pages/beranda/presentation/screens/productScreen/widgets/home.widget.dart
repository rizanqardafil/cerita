import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shamo/pages/artikel/model/NBModel.dart';
import 'package:shamo/pages/artikel/utils/NBColors.dart';
import 'package:shamo/pages/beranda/presentation/screens/productScreen/widgets/banner.widget.dart';

class HomeWidget extends StatefulWidget {
  static String tag = '/NBAllNewsComponent';

  const HomeWidget({super.key});

  @override
  NBAllNewsComponentState createState() => NBAllNewsComponentState();
}

class NBAllNewsComponentState extends State<HomeWidget> {
  
  PageController? pageController;
  int pageIndex = 0;

  List<NBBannerItemModel> mBannerItems = nbGetBannerItems();
 

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pageController =
        PageController(initialPage: pageIndex, viewportFraction: 0.9);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.height,
          SizedBox(
            height: 200,
            child: PageView(
              controller: pageController,
              children: List.generate(mBannerItems.length, (index) {
                return Image.asset(mBannerItems[index].image!, fit: BoxFit.fill)
                    .cornerRadiusWithClipRRect(16)
                    .paddingRight(pageIndex < 2 ? 16 : 0);
              }),
              onPageChanged: (value) {},
            ),
          ),
          8.height,
          DotIndicator(
              pageController: pageController!,
              pages: mBannerItems,
              indicatorColor: NBPrimaryColor),
          16.height,
        ],
      ),
    );
  }
}
