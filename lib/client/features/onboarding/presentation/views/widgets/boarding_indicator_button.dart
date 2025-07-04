import 'package:flutter/material.dart';
import 'package:go_car/client/core/utils/client_app_router.dart';
import 'package:go_car/client/features/onboarding/presentation/boarding_model.dart';
import 'package:go_car/core/constance.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingIndicatorButton extends StatelessWidget {
  const BoardingIndicatorButton({
    super.key,
    required this.boardingController,
    required this.boardingModel,
    required this.isLast,
  });

  final PageController boardingController;
  final List<BoardingModel> boardingModel;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: boardingController,
            count: boardingModel.length,
            effect: const ExpandingDotsEffect(
              activeDotColor: primaryColor,
              dotColor: Color(0x4128c76f),
              dotWidth: 10,
              dotHeight: 10,
              spacing: 5.5,
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x6428c76f),
            ),
            alignment: Alignment.center,
            child: Container(
              width: 49,
              height: 49,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor,
              ),
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () {
                  if (isLast) {
                    GoRouter.of(context).pushReplacement(ClientAppRouter.rLogin);
                  } else {
                    boardingController.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
