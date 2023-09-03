import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shamo/pages/artikel/component/NBAllNewsComponent.dart';
import 'package:shamo/pages/artikel/component/NBNewsComponent.dart';
import 'package:shamo/pages/artikel/model/NBModel.dart';
import 'package:shamo/pages/artikel/utils/NBColors.dart';
import 'package:shamo/pages/artikel/utils/NBDataProviders.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/beranda/app/constants/app.colors.dart';

class NBHomeScreen extends StatefulWidget {
  static String tag = '/NBHomeScreen';

  const NBHomeScreen({super.key});

  @override
  NBHomeScreenState createState() => NBHomeScreenState();
}

class NBHomeScreenState extends State<NBHomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<NBDrawerItemModel> mDrawerList = nbGetDrawerItems();

  List<NBNewsDetailsModel> mNewsList = nbGetNewsDetails();
  List<NBNewsDetailsModel> mTechNewsList = [],
      mFashionNewsList = [],
      mSportsNewsList = [],
      mScienceNewsList = [];

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    tabController = TabController(length: 4, vsync: this);
    for (var element in mNewsList) {
      if (element.categoryName == 'Health and Care') {
        mFashionNewsList.add(element);
      } else if (element.categoryName == 'Sexual Behavior') {
        mSportsNewsList.add(element);
      } else if (element.categoryName == 'Habit Culture') {
        mScienceNewsList.add(element);
      }
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      key: _scaffoldKey,
      appBar: AppBar(
       title: Text('Cerita Yuk', style: boldTextStyle(color: themeFlag ? AppColors.creamColor : AppColors.mirage, size: 20)),
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: 'All News'),
            Tab(text: 'Health and Care'),
            Tab(text: 'Sexual Behavior'),
            Tab(text: 'Habit Culture')
          ],
          labelStyle: boldTextStyle(),
          labelColor: themeFlag ? AppColors.white : AppColors.creamColor,
          unselectedLabelStyle: primaryTextStyle(),
          unselectedLabelColor: grey,
          isScrollable: true,
          indicatorColor: NBPrimaryColor,
          indicatorWeight: 3,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          NBAllNewsComponent(),
          NBNewsComponent(list: mFashionNewsList),
          NBNewsComponent(list: mSportsNewsList),
          NBNewsComponent(list: mScienceNewsList),
        ],
      ),
    );
  }
}
