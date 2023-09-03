import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({
    Key? key,
    required this.topText,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    required this.buttonTitle,
    required this.buttonIcon,
    required this.buttonColor,
    this.iconColor,
    this.buttonTextColor,
    required this.onPressed,
    required this.onSkip, // Add onSkip callback
  }) : super(key: key);

  final String? topText;
  final String? imagePath;
  final String? title;
  final String? subTitle;
  final String? buttonTitle;
  final IconData? buttonIcon;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? iconColor;
  final VoidCallback onPressed;
  final VoidCallback onSkip; // Define onSkip callback

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: onSkip, // Assign onSkip callback to onTap
                    child: Text(
                      topText!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xffA29292),
                        fontFamily: 'Montserrat Regular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  imagePath!,
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(
                width: 254,
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 27,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Georgia Regular',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                alignment: Alignment.center,
                width: 276,
                child: Text(
                  subTitle!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xffA29292),
                    fontFamily: 'Montserrat Regular',
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              MaterialButton(
                onPressed: onPressed,
                height: 56,
                minWidth: 203,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(23)),
                ),
                color: buttonColor,
                child: Container(
                  alignment: Alignment.center,
                  width: 203,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonTitle!,
                        style: TextStyle(
                          fontSize: 16,
                          color: buttonTextColor,
                          fontFamily: 'Montserrat Regular',
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 24),
                      Icon(
                        buttonIcon,
                        color: iconColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
