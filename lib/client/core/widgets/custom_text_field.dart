import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.fillColor = const Color(0xffEEEEEE),
    this.borderRadius = 12,
    this.hintText,
    required this.prefixIcon,
    required this.iconColor,
    this.onChanged,
  });

  final TextEditingController controller;
  final Color fillColor;
  final double borderRadius;
  final String? hintText;
  final IconData prefixIcon;
  final Color iconColor;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, size: 10, color: iconColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
