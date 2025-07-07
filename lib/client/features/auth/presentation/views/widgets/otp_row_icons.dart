
import 'package:flutter/material.dart';
import 'package:go_car/client/features/auth/presentation/controller/phone_login_cubit/phone_login_cubit.dart';
import 'package:go_car/core/constance.dart';
import 'package:go_router/go_router.dart';

class OtpRowIcons extends StatelessWidget {
  const OtpRowIcons({
    super.key,
    required this.otpCubit,
    required this.otpCode,
  });

  final PhoneLoginCubit otpCubit;
  final String otpCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 45,
          width: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
          child: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          height: 45,
          width: 100,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextButton(
            onPressed: () {
              otpCubit.submitOtp(otpCode);
            },
            child: Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Next',
                  style: Theme.of(context).textTheme.displayLarge!
                      .copyWith(color: Colors.black),
                ),
                const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
