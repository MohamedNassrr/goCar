import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.inputType,
    this.validate,
    required this.onSubmit,
    required this.hintText,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final FormFieldValidator<String>? validate;
  final Function(String) onSubmit;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validate,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        prefixIcon: Icon(Icons.phone_outlined, color: Colors.grey[600]),
        hintText: hintText,
      ),
    );
  }
}
