import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSelectCarType extends StatelessWidget {
  const CustomSelectCarType({super.key, required this.onPressed, required this.carImage, required this.carTypeText, required this.destinationToPickUpTime, required this.tripPrice, required this.carTypeDescriptionText});


  final Function() onPressed;
  final String carImage;
  final String carTypeText;
  final String destinationToPickUpTime;
  final String tripPrice;
  final String carTypeDescriptionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffEEEEEE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  carImage,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          carTypeText,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 2,
                          children: [
                            const Icon(
                              FontAwesomeIcons.solidUser,
                              size: 12,
                            ),
                            Text(
                              '4',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '$destinationToPickUpTime min away',
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        carTypeDescriptionText,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Text(
                  '\$ $tripPrice',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}