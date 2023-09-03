import 'package:flutter/material.dart';
import 'package:shamo/welcome/components/text_field_container.dart';
import 'package:shamo/welcome/Screens/constant.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool isPasswordType;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String>? validator;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.isPasswordType = false,
    required this.controller,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: controller,
        obscureText: isPasswordType,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
