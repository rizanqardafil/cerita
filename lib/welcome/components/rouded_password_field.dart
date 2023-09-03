import 'package:flutter/material.dart';
import 'package:shamo/welcome/components/text_field_container.dart';
import 'package:shamo/welcome/Screens/constant.dart';

class RoundedPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator; // Add this line

  const RoundedPasswordField({
    Key? key,
    required this.controller,
    required this.onChanged,
    this.validator, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        validator: validator, // Add this line
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

