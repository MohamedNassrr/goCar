import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/core/controllers/tracking_user_cubit/tracking_user_cubit.dart';
import 'package:go_car/driver/features/driver_home/presentation/views/widgets/driver_home_view_body.dart';

class DriverHomeView extends StatelessWidget {
  const DriverHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => TrackingUserCubit(),
        child: const SafeArea(child: DriverHomeViewBody()),
      ),
    );
  }
}
