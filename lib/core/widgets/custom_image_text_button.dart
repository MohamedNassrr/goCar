import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/core/constance.dart';
import 'package:go_car/core/widgets/custom_circule_indicator.dart';

class CustomImageTextButton extends StatelessWidget {
  const CustomImageTextButton({
    super.key,
    this.height = 45,
    this.boarderRadius = 12,
    this.buttonColor = primaryColor,
    this.textColor = Colors.white,
    required this.onPressed,
    required this.buttonText,
    this.width = double.infinity,
    this.isLoading = false,
    required this.image,
    required this.imageHeight,
    required this.imageWidth,
    this.spacing = 0,
  });

  final double height;
  final double width;
  final double boarderRadius;
  final Color? buttonColor;
  final Color? textColor;
  final Function() onPressed;
  final String buttonText;
  final bool isLoading;
  final String image;
  final double imageHeight;
  final double imageWidth;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(boarderRadius),
        ),
        child: isLoading ? const CustomCircleIndicator(): Row(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(image),
              width: imageWidth.w,
              height: imageHeight.h,
            ),
            Text(
              buttonText,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
