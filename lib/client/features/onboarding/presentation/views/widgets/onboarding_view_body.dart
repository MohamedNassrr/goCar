import 'package:flutter/material.dart';
import 'package:go_car/client/core/utils/client_assets_data.dart';
import 'package:go_car/client/features/onboarding/presentation/boarding_model.dart';
import 'package:go_car/client/features/onboarding/presentation/views/widgets/boarding_indicator_button.dart';
import 'package:go_car/client/features/onboarding/presentation/views/widgets/skip_button.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  List<BoardingModel> boardingModel = [
    BoardingModel(
      imageUrl: ClientAssetsData.clientOnBoardingOne,
      title: 'Welcome to goCar',
      description:
          'Discover a smarter way to move around the city. Wherever you are, your next ride is just a tap away.',
    ),
    BoardingModel(
      imageUrl: ClientAssetsData.clientOnBoardingTwo,
      title: 'Track Your Ride in Real Time',
      description:
          'Know exactly where your driver is with live tracking and clear ETAs—no more guessing or waiting in the dark.',
    ),
    BoardingModel(
      imageUrl: ClientAssetsData.clientOnBoardingThree,
      title: 'Fast, Reliable, and On-Time',
      description:
          'Skip the delays. Get matched with nearby drivers and reach your destination quickly and safely.',
    ),
  ];

  var boardingController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SkipButton(),
        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: boardingModel.length,
            physics: const BouncingScrollPhysics(),
            controller: boardingController,
            onPageChanged: (int index) {
              if (index == boardingModel.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                setState(() {
                  isLast = false;
                });
              }
            },
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Image(image: AssetImage(boardingModel[index].imageUrl)),
                      Text(
                        boardingModel[index].title,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        boardingModel[index].description,
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                ),
          ),
        ),
        BoardingIndicatorButton(
          boardingController: boardingController,
          boardingModel: boardingModel,
          isLast: isLast,
        ),
      ],
    );
  }
}
