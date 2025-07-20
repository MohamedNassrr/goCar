import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_car/client/features/home/presentation/controller/search_place_cubit/search_cubit.dart';
import 'package:go_car/client/features/home/presentation/controller/search_place_cubit/search_state.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessStates) {
          return Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder:
                  (context, index) => InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffEEEEEE),
                        ),
                        child: const Icon(Icons.pin_drop_rounded),
                      ),
                      title: Text(
                        state.places[index].description!,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
              separatorBuilder:
                  (context, index) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(),
                  ),
              itemCount: state.places.length,
            ),
          );
        } else {
          return const Center(child: Text('Where do you want to go?'));
        }
      },
    );
  }
}
