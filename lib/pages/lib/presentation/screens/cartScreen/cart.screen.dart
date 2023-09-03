import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/lib/app/constants/app.assets.dart';
import 'package:shamo/pages/lib/app/constants/app.colors.dart';
import 'package:shamo/pages/lib/app/routes/app.routes.dart';
import 'package:shamo/pages/lib/core/notifiers/cart.notifier.dart';
import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/beranda/core/notifiers/user.notifier.dart';
import 'package:shamo/pages/lib/presentation/screens/cartScreen/widgets/show.cart.data.dart';
import 'package:shamo/pages/lib/presentation/widgets/custom.back.btn.dart';
import 'package:shamo/pages/lib/presentation/widgets/custom.loader.dart';
import 'package:shamo/pages/lib/presentation/widgets/custom.text.style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void dispose() {
    // Provider.of<PaymentService>(context, listen: false).disposeRazorPay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = themeNotifier.darkTheme;
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  CustomBackButton(
                    route: AppRouter.homeRoute,
                    themeFlag: themeFlag,
                  ),
                  Text(
                    'Cart',
                    style: CustomTextWidget.bodyTextB2(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                child: Consumer<CartNotifier>(
                  builder: (context, notifier, _) {
                    return FutureBuilder(
                      future: notifier.checkCartData(
                          context: context,
                          useremail: userNotifier.getUserEmail!),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return customLoader(
                            context: context,
                            themeFlag: themeFlag,
                            text: 'Eww Cart is Empty',
                            lottieAsset: AppAssets.nodata,
                          );
                        } else {
                          return showCartData(
                            height: MediaQuery.of(context).size.height * 0.17,
                            snapshot: snapshot,
                            themeFlag: themeFlag,
                            context: context,
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
