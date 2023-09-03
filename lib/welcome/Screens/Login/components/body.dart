import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamo/welcome/Screens/Login/components/background.dart';
import 'package:shamo/welcome/Screens/SignUp/signup_screen.dart';
import 'package:shamo/welcome/components/rounded_button.dart';
import 'package:shamo/welcome/components/rounded_input_fied.dart';
import 'package:shamo/welcome/components/rouded_password_field.dart';
import 'package:shamo/welcome/components/already_have_an_account_check.dart';
import 'package:shamo/pages/home/main_page.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();

  Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Your Email",
              controller: _emailTextController,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: _passwordTextController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Login",
              press: () {
                String email = _emailTextController.text;
                String password = _passwordTextController.text;

                // Add your authentication logic here
                // For example, using FirebaseAuth
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then((value) {
                  // Authentication successful, navigate to MainPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                }).catchError((error) {
                  // Authentication failed, show error message or handle the error
                  print("Error logging in: ${error.toString()}");

                  // Show an error dialog or toast message
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Login Failed"),
                      content: const Text("Invalid email or password."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
