import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/core/constance.dart';
import 'package:go_car/core/widgets/custom_circule_indicator.dart';

class CustomTextIconButton extends StatelessWidget {
  const CustomTextIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.isIconFirst = true,
    this.iconColor = Colors.white,
    this.textColor = Colors.white,
    required this.onPressed,
    this.isLoading = false,
    this.boarderRadius = 12,
    this.height = 45,
    this.width = double.infinity,
     this.iconSize = 20,
  });

  final String text;
  final Color textColor;
  final IconData icon;
  final Color? iconColor;
  final double height;
  final double width;
  final Color? backgroundColor = primaryColor;
  final bool isIconFirst;
  final Function() onPressed;
  final bool isLoading;
  final double boarderRadius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Icon(icon, color: iconColor,size: iconSize,),
      Text(
        text,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    ];

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(boarderRadius),
      ),
      child:
          isLoading
              ? const CustomCircleIndicator()
              : TextButton(
                onPressed: onPressed,
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: isIconFirst ? children : children.reversed.toList(),
                ),
              ),
    );
  }
}
