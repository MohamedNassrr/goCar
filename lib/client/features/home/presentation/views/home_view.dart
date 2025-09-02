import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/features/home/presentation/controller/routing_cubit/routing_cubit.dart';
import 'package:go_car/client/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:go_car/core/controllers/tracking_user_cubit/tracking_user_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RoutingCubit()),
          BlocProvider(create: (context) => TrackingUserCubit('rider')),
        ],
        child: HomeViewBody(),
      ),
    );
  }
}
