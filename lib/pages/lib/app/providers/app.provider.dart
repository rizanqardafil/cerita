import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shamo/pages/lib/core/notifiers/authentication.notifer.dart';
import 'package:shamo/pages/lib/core/notifiers/cart.notifier.dart';
import 'package:shamo/pages/lib/core/notifiers/product.notifier.dart';
import 'package:shamo/pages/lib/core/notifiers/size.notifier.dart';

import 'package:shamo/pages/beranda/core/notifiers/theme.notifier.dart';
import 'package:shamo/pages/beranda/core/notifiers/user.notifier.dart';
import 'package:shamo/pages/lib/core/service/payment.service.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
    ChangeNotifierProvider(create: (_) => UserNotifier()),
    ChangeNotifierProvider(create: (_) => ProductNotifier()),
    ChangeNotifierProvider(create: (_) => SizeNotifier()),
    ChangeNotifierProvider(create: (_) => CartNotifier()),
    ChangeNotifierProvider(create: (_) => PaymentService()),
  ];
}
