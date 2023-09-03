import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shamo/pages/artikel/model/NBModel.dart';
import 'package:shamo/pages/artikel/utils/NBColors.dart';
import 'package:shamo/pages/artikel/utils/NBAppWidget.dart';
import 'package:shamo/pages/app_styles.dart';

class NBNewsDetailsScreen extends StatefulWidget {
  static String tag = '/NBNewsDetailsScreen';

  final NBNewsDetailsModel? newsDetails;

  const NBNewsDetailsScreen({super.key, this.newsDetails});

  @override
  NBNewsDetailsScreenState createState() => NBNewsDetailsScreenState();
}

class NBNewsDetailsScreenState extends State<NBNewsDetailsScreen> {
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              finish(context);
            }),
        elevation: 0,
        backgroundColor: white,
      ),
      backgroundColor: Colors.blue,
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '${widget.newsDetails!.categoryName}',
                  style: boldTextStyle(color: NBPrimaryColor),
                ),
              ),
              Row(
                children: [
                  Text('${widget.newsDetails!.title}',
                          style: boldTextStyle(size: 20))
                      .expand(flex: 3),
                  widget.newsDetails!.isBookmark
                      ? IconButton(
                          icon: const Icon(Icons.bookmark),
                          onPressed: () {
                            setState(() {
                              widget.newsDetails!.isBookmark =
                                  !widget.newsDetails!.isBookmark;
                            });
                            toasty(context, 'Removed from Bookmark');
                          })
                      : IconButton(
                          icon: const Icon(Icons.bookmark_border),
                          onPressed: () {
                            setState(() {
                              widget.newsDetails!.isBookmark =
                                  !widget.newsDetails!.isBookmark;
                            });
                            toasty(context, 'Added to Bookmark');
                          }),
                ],
              ),
              16.height,
              commonCacheImageWidget(widget.newsDetails!.image, 200,
                      width: context.width(), fit: BoxFit.cover)
                  .cornerRadiusWithClipRRect(16),
              16.height,
              16.height,
              Text('${widget.newsDetails!.details}',
                  style: kPoppinsMedium, textAlign: TextAlign.justify),
              16.height,
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
