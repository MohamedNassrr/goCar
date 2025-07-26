import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMapsBottomSheet extends StatelessWidget {
  const CustomMapsBottomSheet({super.key, required this.onSelect});
  final VoidCallback onSelect;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 100.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffEEEEEE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: WidgetStateProperty.all(Colors.grey[300]),
              ),
              onPressed:onSelect,
              child: Text(
                'Where to?',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
