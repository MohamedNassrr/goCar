import 'package:flutter/material.dart';
import 'package:go_car/core/constance.dart';

class CustomIconTextButton extends StatelessWidget {
  const CustomIconTextButton({
    super.key,
    this.height = 45,
    this.boarderRadius = 12,
    this.buttonColor = primaryColor,
    this.textColor = Colors.white,
    required this.onPressed,
    required this.buttonText,
    this.width = double.infinity,
    required this.iconButton,
    this.iconColor = Colors.white,
  });

  final double? height;
  final double? width;
  final double boarderRadius;
  final Color? buttonColor;
  final Color? textColor;
  final Color? iconColor;
  final Function() onPressed;
  final String buttonText;
  final IconData iconButton;


  @override
  Widget build(BuildContext context) {


    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(boarderRadius),
      ),
      child: TextButton(
        onPressed: onPressed,
        child:  Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                iconButton,
              color: iconColor,
            ),
            Text(
                buttonText,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}