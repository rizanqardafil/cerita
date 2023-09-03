import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/onboarding'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor7,
      body: Center(
        child: Container(
          width: 430,
          height: 450,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/logo_real.png'),
            ),
          ),
        ),
      ),
    );
  }
}
