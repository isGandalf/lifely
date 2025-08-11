import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isObscure,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText to continue';
        }
        return null;
      },
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      decoration: InputDecoration(hintText: hintText),
      obscureText: isObscure,
    );
  }
}
