import 'package:flutter/material.dart';
import 'package:go_car/core/constance.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.height = 45,
    this.boarderRadius = 12,
    this.buttonColor = primaryColor,
    this.textColor = Colors.white,
    required this.onPressed,
    required this.buttonText,
    this.width = double.infinity,
    this.isLoading = false,
  });

  final double? height;
  final double? width;
  final double boarderRadius;
  final Color? buttonColor;
  final Color? textColor;
  final Function() onPressed;
  final String buttonText;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(boarderRadius),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: isLoading ? const SizedBox(
                  height:30,
                  width: 30,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ) : Text(
          buttonText.toUpperCase(),
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: textColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
