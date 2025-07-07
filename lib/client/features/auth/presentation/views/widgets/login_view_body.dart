import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/client/features/auth/presentation/controller/phone_login_cubit/phone_login_cubit.dart';
import 'package:go_car/client/features/auth/presentation/controller/phone_login_cubit/phone_login_states.dart';
import 'package:go_car/core/widgets/custom_divider.dart';
import 'package:go_car/core/widgets/custom_text_button.dart';
import 'package:go_car/client/features/auth/presentation/views/widgets/icon_text_buttons.dart';
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
          GoRouter.of(context).push(ClientAppRouter.rOtpScreen,extra: context.read<PhoneLoginCubit>());
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
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone should not be empty!';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    if (formKey.currentState!.validate()) {
                      phoneCubit.phoneAuth(phoneNumber: phoneController.text);
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Colors.grey[600],
                    ),
                    hintText: '01XX XXX XXXX',
                  ),
                ),
                CustomTextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      phoneCubit.phoneAuth(phoneNumber: phoneController.text);
                    }
                  },
                  buttonText: 'continue',
                  textColor: Colors.black,
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
