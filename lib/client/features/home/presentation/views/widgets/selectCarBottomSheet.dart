import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/client/core/utils/client_assets_data.dart';
import 'package:go_car/client/core/widgets/custom_select_car_type.dart';

class SelectCarBottomSheet extends StatelessWidget {
  const SelectCarBottomSheet({super.key});


  @override
  Widget build(BuildContext context) {
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
          children: [

            Flexible(
              child: CustomSelectCarType(
                onPressed: () {},
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
  }
}
