import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_car/client/core/services/service_locator.dart';
import 'package:go_car/client/core/widgets/custom_text_field.dart';
import 'package:go_car/client/features/home/data/repos/place_repos/place_repo_impl.dart';
import 'package:go_car/client/features/home/presentation/controller/geo_coding_cubit/geo_coding_cubit.dart';
import 'package:go_car/client/features/home/presentation/controller/geo_coding_cubit/geo_coding_state.dart';
import 'package:go_car/client/features/home/presentation/controller/search_place_cubit/search_cubit.dart';
import 'package:go_car/client/features/home/presentation/views/widgets/search_list_view.dart';
import 'package:uuid/uuid.dart';

class SelectDestinationBody extends StatefulWidget {
  const SelectDestinationBody({super.key});

  @override
  State<SelectDestinationBody> createState() => _SelectDestinationBodyState();
}

class _SelectDestinationBodyState extends State<SelectDestinationBody> {
  final TextEditingController userLocationController = TextEditingController();
  final TextEditingController selectLocationController =
      TextEditingController();
  late Uuid uuid;
  String? sessionToken;

  @override
  void initState() {
    uuid = const Uuid();
    super.initState();
  }

  @override
  void dispose() {
    selectLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GeoCodingCubit()..convertToString()),
        BlocProvider(
          create: (context) => SearchCubit(getIt.get<PlacesRepoImpl>()),
        ),
      ],
      child: BlocBuilder<GeoCodingCubit, GeoCodingState>(
        builder: (context, state) {
          if (state is GeoCodingConvertedStates) {
            userLocationController.text = state.address;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: [
                  CustomTextField(
                    controller: userLocationController,
                    iconColor: Colors.blue,
                    prefixIcon: Icons.circle,
                  ),
                  CustomTextField(
                    controller: selectLocationController,
                    iconColor: Colors.orange,
                    prefixIcon: Icons.circle,
                    hintText: 'Where to?',
                    onChanged: (_) {
                      context.read<SearchCubit>().fetchPrediction(
                        input: selectLocationController.text,
                        sessionToken: uuid.v4(),
                      );
                    },
                  ),
                  const SearchListView(),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
        },
      ),
    );
  }
}
