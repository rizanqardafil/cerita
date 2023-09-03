import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shamo/pages/lib/app/constants/app.assets.dart';
import 'package:shamo/pages/lib/app/constants/app.colors.dart';
import 'package:shamo/pages/lib/core/notifiers/product.notifier.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/lib/presentation/widgets/custom.loader.dart';

class ProductDetail extends StatefulWidget {
  final ProductDetailsArgs productDetailsArguements;
  const ProductDetail({
    Key? key,
    required this.productDetailsArguements,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
          child: Consumer<ProductNotifier>(builder: (context, notifier, _) {
            return FutureBuilder(
              future: notifier.fetchProductDetail(
                context: context,
                id: widget.productDetailsArguements.id.toString(),
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: customLoader(
                        context: context,
                        themeFlag: themeFlag,
                        lottieAsset: AppAssets.onBoardingOne,
                        text: 'Please Wait Till It Loads'),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: customLoader(
                      context: context,
                      themeFlag: themeFlag,
                      text: 'Oops Some Error Occurred',
                      lottieAsset: AppAssets.error,
                    ),
                  );
                } else {
                  return Center(
                    child: customLoader(
                      context: context,
                      themeFlag: themeFlag,
                      text: 'Oops Some Error Occurred',
                      lottieAsset: AppAssets.error,
                    ),
                  );
                }
              },
            );
          }),
        ),
      ),
    );
  }
}

class ProductDetailsArgs {
  final dynamic id;
  const ProductDetailsArgs({required this.id});
}
