import 'package:flutter/material.dart';
import 'package:go_car/core/services/local_storage.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/core/constance.dart';
import 'package:go_router/go_router.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all(Colors.grey[200]),
        ),
        onPressed: () async {
          await LocalStorage.setData(key: 'onboarding', value: true);
          if (context.mounted) {
            GoRouter.of(context).pushReplacement(ClientAppRouter.rLogin);
          }
        },
        child: Text(
          'skip',
          style: Theme.of(
            context,
          ).textTheme.displayMedium!.copyWith(color: primaryColor),
        ),
      ),
    );
  }
}
