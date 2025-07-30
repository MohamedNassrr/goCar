import 'package:flutter/material.dart';
import 'package:go_car/core/features/auth/presentation/controller/phone_login_cubit/phone_login_cubit.dart';
import 'package:go_car/core/features/auth/presentation/controller/phone_login_cubit/phone_login_states.dart';
import 'package:go_car/core/constance.dart';
import 'package:go_car/core/widgets/custom_text_icon_button.dart';
import 'package:go_router/go_router.dart';

class OtpRowIcons extends StatelessWidget {
  const OtpRowIcons({
    super.key,
    required this.otpCubit,
    required this.otpCode,
    required this.otpCubitState,
  });

  final PhoneLoginCubit otpCubit;
  final TextEditingController otpCode;
  final PhoneLoginStates otpCubitState;

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
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
        CustomTextIconButton(
          text: 'Next',
          icon: Icons.arrow_forward_outlined,
          textColor: Colors.white,
          onPressed: () {
            otpCubit.submitOtp(otpCode.text);
          },
          boarderRadius: 30,
          width: 100,
          height: 45,
          iconColor: Colors.white,
          isIconFirst: false,
          isLoading: otpCubitState is PhoneLoadingStates ? true : false,
        ),
      ],
    );
  }
}
