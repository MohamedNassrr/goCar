import 'package:flutter/material.dart';

class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
      width: 30,
      child: Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
