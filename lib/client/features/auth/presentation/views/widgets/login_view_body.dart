import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/client/features/auth/presentation/controller/phone_login_cubit/phone_login_cubit.dart';
import 'package:go_car/client/features/auth/presentation/controller/phone_login_cubit/phone_login_states.dart';
import 'package:go_car/client/features/auth/presentation/views/widgets/icon_text_buttons.dart';
import 'package:go_car/core/widgets/custom_divider.dart';
import 'package:go_car/core/widgets/custom_form_field.dart';
import 'package:go_car/core/widgets/custom_text_button.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<PhoneLoginCubit, PhoneLoginStates>(
      listener: (context, state) {
        if (state is PhoneCodeSubmittedStates) {
          GoRouter.of(context).push(
            ClientAppRouter.rOtpScreen,
            extra: context.read<PhoneLoginCubit>(),
          );

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
        var phoneCubit = context.read<PhoneLoginCubit>();
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter Your Phone number',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                CustomFormField(
                  controller: phoneController,
                  inputType: TextInputType.phone,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'phone should not be empty!';
                    }
                    return null;
                  },
                  onSubmit: (_) {
                    if (formKey.currentState!.validate()) {
                      phoneCubit.phoneAuth(phoneNumber: phoneController.text);
                    }
                  },
                  hintText: '01XX XXX XXXX',
                ),
                CustomTextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      phoneCubit.phoneAuth(phoneNumber: phoneController.text);
                    }
                  },
                  buttonText: 'continue',
                  textColor: Colors.white,
                  isLoading: state is PhoneLoadingStates ? true : false,
                ),
                const SizedBox(height: 5),
                const CustomDivider(),
                const IconTextButtons(),
              ],
            ),
          ),
        );
      },
    );
  }
}
