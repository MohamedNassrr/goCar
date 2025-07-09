import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/core/widgets/custom_text_icon_button.dart';
import 'package:go_router/go_router.dart';

class IconTextButtons extends StatelessWidget {
  const IconTextButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CustomTextIconButton(
          onPressed: (){},
          text: 'Continue with Google',
          icon: FontAwesomeIcons.google,
        ),
        CustomTextIconButton(
          onPressed: (){
            GoRouter.of(context).push(ClientAppRouter.rEmailScreen);
          },
          text: 'Continue with email',
          icon: FontAwesomeIcons.envelope,

        ),
      ],
    );
  }
}


