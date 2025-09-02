import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/client/core/utils/client_assets_data.dart';
import 'package:go_car/client/core/widgets/custom_select_car_type.dart';
import 'package:go_car/client/features/home/presentation/controller/geo_coding_cubit/geo_coding_cubit.dart';
import 'package:go_car/client/features/home/presentation/controller/geo_coding_cubit/geo_coding_state.dart';
import 'package:go_car/client/features/trip_request/presentation/views/trip_bottom_sheet.dart';
import 'package:go_car/core/widgets/custom_circule_indicator.dart';

class SelectCarBottomSheet extends StatelessWidget {
  const SelectCarBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeoCodingCubit()..convertToString(),
      child: BlocBuilder<GeoCodingCubit, GeoCodingState>(
        builder: (context, state) {
          String userLocation;
          if (state is GeoCodingConvertedStates) {
            userLocation = state.address;
            return Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 220.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: CustomSelectCarType(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            enableDrag: true,
                            isDismissible: true,
                            showDragHandle: true,
                            builder:
                                (context) =>
                                    TripBottomSheet(userLocation: userLocation),
                          );
                        },
                        carImage: ClientAssetsData.normalCar,
                        carTypeText: 'Saver',
                        destinationToPickUpTime: '2',
                        tripPrice: '180',
                        carTypeDescriptionText: 'Affordable, compact rides',
                      ),
                    ),
                    Flexible(
                      child: CustomSelectCarType(
                        onPressed: () {},
                        carImage: ClientAssetsData.comfortableCar,
                        carTypeText: 'Comfortable',
                        destinationToPickUpTime: '2',
                        tripPrice: '200',
                        carTypeDescriptionText:
                            'Comfortable sedans, top - quality drivers',
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const CustomCircleIndicator();
          }
        },
      ),
    );
  }
}
