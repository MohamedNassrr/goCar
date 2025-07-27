import 'package:flutter/material.dart';
import 'package:go_car/client/features/auth/presentation/views/widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: OtpViewBody()));
  }
}
