import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Checkout Detail',
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: const [],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
    );
  }
}
