import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:go_car/client/features/home/data/repos/place_repos/place_repo.dart';
import 'package:go_car/client/features/home/presentation/controller/search_place_cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.placeRepo) : super(SearchInitialStates());

  final PlaceRepo placeRepo;

  Future<void> fetchPrediction({
    required String input,
    required String sessionToken,
  }) async {
    var result = await placeRepo.fetchPrediction(
      input: input,
      sessionToken: sessionToken,
    );
    result.fold(
      (failure) {
        emit(SearchFailureStates(failure: failure.toString()));
        log('search failure: ${failure.toString()}');
      },
      (places) {
        emit(SearchSuccessStates(places: places));
      },
    );
  }
}
