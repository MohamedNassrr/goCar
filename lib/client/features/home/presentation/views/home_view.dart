import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/features/home/presentation/controller/routing_cubit/routing_cubit.dart';
import 'package:go_car/client/features/home/presentation/controller/tracking_user_cubit/tracking_user_cubit.dart';
import 'package:go_car/client/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RoutingCubit()),
          BlocProvider(create: (context) => TrackingUserCubit()),
        ],
        child: const HomeViewBody(),
      ),
    );
  }
}
