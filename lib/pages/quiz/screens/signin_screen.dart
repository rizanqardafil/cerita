import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shamo/pages/quiz/providers/auth.dart';
import 'package:shamo/pages/quiz/widgets/custom_divider.dart';
import 'package:shamo/pages/quiz/widgets/custom_icon_button.dart';
import 'package:shamo/pages/quiz/widgets/signin_form.dart';

import '../core/app_route.dart';
import '../widgets/wave.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff8165FF),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/space-ship.svg',
                  height: 200,
                ),
                const Wave(),
              ],
            ),
            Container(
              width: double.infinity,
              color: const Color(0xff1F1147),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  const SigninForm(),
                  const CustomDivider(),
                  CustomIconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const Dialog(
                          backgroundColor: Colors.transparent,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                      auth.login(SigninMethod.google).then((_) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoute.home);
                      });
                    },
                    text: 'Sign in with google',
                    icon: const Icon(Icons.person),
                  ),
                  SizedBox(
                      height:
                          MediaQuery.of(context).size.height > 700 ? 150 : 70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
