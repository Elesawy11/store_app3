import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.inputType,
      this.onChanged,
      this.obscureText = false,
      this.onSubmitted,
      this.controller});
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? hintText;
  final TextInputType? inputType;
  final bool? obscureText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        obscureText: obscureText!,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(24),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}
