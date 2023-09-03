import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shamo/welcome/Screens/SignUp/components/background.dart';
import 'package:shamo/welcome/components/already_have_an_account_check.dart';
import 'package:shamo/welcome/Screens/Login/login_screen.dart';
import 'package:shamo/welcome/components/rouded_password_field.dart';
import 'package:shamo/welcome/components/rounded_button.dart';
import 'package:shamo/welcome/components/rounded_input_fied.dart';
import 'package:shamo/welcome/Screens/SignUp/components/or_divider.dart';
import 'package:shamo/welcome/Screens/SignUp/components/social_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamo/welcome/Screens/reusable_widget.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final String name = _nameTextController.text.trim();
        final String email = _emailTextController.text.trim();
        final String password = _passwordTextController.text.trim();

        // Create user with email and password
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Update user display name
        final User? user = FirebaseAuth.instance.currentUser;
        await user?.updateDisplayName(name);

        // Navigate to the sign-in screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      } catch (error) {
        // Handle sign-up error
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(error.toString()),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'SIGNUP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                'assets/icons/signup.svg',
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: 'Your Name',
                controller: _nameTextController,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              RoundedInputField(
                hintText: 'Your Email',
                controller: _emailTextController,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              RoundedPasswordField(
                controller: _passwordTextController,
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              RoundedButton(
                text: 'SIGNUP',
                press: _isLoading ? null : _signUp,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: 'assets/icons/facebook.svg',
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: 'assets/icons/google-plus.svg',
                    press: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
