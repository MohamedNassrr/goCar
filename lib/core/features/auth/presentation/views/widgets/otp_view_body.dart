import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/core/features/auth/presentation/controller/phone_login_cubit/phone_login_cubit.dart';
import 'package:go_car/core/features/auth/presentation/controller/phone_login_cubit/phone_login_states.dart';
import 'package:go_car/core/features/auth/presentation/views/widgets/otp_row_icons.dart';
import 'package:go_car/core/constance.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpViewBody extends StatelessWidget {
  OtpViewBody({super.key, required this.successRouting});

  final TextEditingController otpController = TextEditingController();

  final String successRouting;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneLoginCubit, PhoneLoginStates>(
      listener: (context, state) {
        if (state is PhoneSuccessStates) {
          GoRouter.of(context).go(successRouting);
        }
        if (state is PhoneFailureStates) {
          SnackBar snackBar = SnackBar(
            content: Text(state.failure.toString()),
            backgroundColor: Colors.grey,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        var otpCubit = context.read<PhoneLoginCubit>();
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 10,
            children: [
              Text(
                'Enter 6-digit code sent via SMS at 01000000000',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              PinCodeTextField(
                appContext: context,
                length: 6,
                autoFocus: true,
                animationType: AnimationType.scale,
                controller: otpController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  inactiveColor: Colors.grey[400],
                  selectedColor: Colors.grey[400],
                  activeColor: primaryColor,
                  errorBorderColor: Colors.red,
                ),
                cursorColor: Colors.black45,
                validator: (value) {
                  if (value!.isEmpty) {}
                  return null;
                },
                onCompleted: (code) {
                  otpController.text = code;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              OtpRowIcons(
                otpCubit: otpCubit,
                otpCode: otpController,
                otpCubitState: state,
              ),
            ],
          ),
        );
      },
    );
  }
}
