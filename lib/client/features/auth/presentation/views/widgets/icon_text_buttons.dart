import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/core/services/facebook_service.dart';
import 'package:go_car/client/core/services/google_auth_service.dart';
import 'package:go_car/client/core/services/service_locator.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/client/core/utils/client_assets_data.dart';
import 'package:go_car/client/features/auth/presentation/controller/facebook_cubit/facebook_auth_states.dart';
import 'package:go_car/client/features/auth/presentation/controller/facebook_cubit/facebook_cubit.dart';
import 'package:go_car/client/features/auth/presentation/controller/google_auth_cubit/google_auth_cubit.dart';
import 'package:go_car/client/features/auth/presentation/controller/google_auth_cubit/google_auth_states.dart';
import 'package:go_car/core/widgets/custom_image_text_button.dart';
import 'package:go_router/go_router.dart';

class IconTextButtons extends StatelessWidget {
  const IconTextButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        BlocProvider(
          create:
              (BuildContext context) =>
                  GoogleAuthCubit(getIt.get<GoogleAuthService>()),
          child: BlocConsumer<GoogleAuthCubit, GoogleAuthStates>(
            listener: (BuildContext context, state) {
              if (state is GoogleSuccessStates) {
                GoRouter.of(
                  context,
                ).pushReplacement(ClientAppRouter.rHomeScreen);
              }
              if (state is GoogleFailureStates) {
                SnackBar snackBar = SnackBar(
                  content: Text(state.failure.toString()),
                  backgroundColor: Colors.grey,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              var googleCubit = context.read<GoogleAuthCubit>();
              return CustomImageTextButton(
                onPressed: () {
                  googleCubit.googleAuth();
                },
                buttonText: 'Continue with Google',
                image: ClientAssetsData.clientGoogleIcon,
                imageHeight: 30,
                imageWidth: 30,
                isLoading: state is GoogleLoadingStates ? true : false,
              );
            },
          ),
        ),
        BlocProvider(
          create:
              (BuildContext context) =>
                  FacebookAuthCubit(getIt.get<FacebookAuthService>()),
          child: BlocConsumer<FacebookAuthCubit, FacebookAuthState>(
            listener: (context, state) {
              if (state is FacebookAuthSuccessState) {
                GoRouter.of(
                  context,
                ).pushReplacement(ClientAppRouter.rHomeScreen);
              }
            },
            builder: (context, state) {
              var facebookCubit = context.read<FacebookAuthCubit>();
              return CustomImageTextButton(
                onPressed: () {
                  facebookCubit.facebookSignIn();
                },
                buttonText: 'Continue with Facebook',
                image: ClientAssetsData.clientFacebookIcon,
                imageHeight: 20,
                imageWidth: 20,
                spacing: 5,
                isLoading: state is FacebookAuthLoadingState ? true : false,
              );
            },
          ),
        ),
      ],
    );
  }
}
