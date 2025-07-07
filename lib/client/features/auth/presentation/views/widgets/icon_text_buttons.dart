import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_car/core/widgets/custom_icon_text_button.dart';

class IconTextButtons extends StatelessWidget {
  const IconTextButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        CustomIconTextButton(
          onPressed: (){},
          buttonText: 'Continue with Google',
          textColor: Colors.black,
          iconButton: FontAwesomeIcons.google,
          iconColor: Colors.black,
        ),
        CustomIconTextButton(
          onPressed: (){},
          buttonText: 'Continue with email',
          textColor: Colors.black,
          iconButton: FontAwesomeIcons.envelope,
          iconColor: Colors.black,
        ),
      ],
    );
  }
}


