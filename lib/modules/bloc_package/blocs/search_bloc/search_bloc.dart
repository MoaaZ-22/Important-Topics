// search_bloc.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final TextEditingController searchController = TextEditingController();
  late final StreamSubscription _textSubscription;

  SearchBloc() : super(SearchInitial()) {
    // Listen to the text controller and add SearchTermChanged events
    searchController.addListener(() {
      add(SearchTermChanged(term: searchController.text));
    });

    on<SearchTermChanged>(
      (event, emit) async {
        emit(SearchLoading());
        try {
          // Simulate fetching search results with a delay
          await Future.delayed(const Duration(milliseconds: 500));
          final results = _getFakeResults(event.term);
          emit(SearchSuccess(results));
        } catch (error) {
          emit(SearchFailure(error.toString()));
        }
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  @override
  Future<void> close() {
    _textSubscription.cancel();
    searchController
        .dispose(); // Make sure to dispose of the controller if it's no longer needed
    return super.close();
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  static List<String> _getFakeResults(String searchTerm) {
    List<String> allResults = [
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Elderberry'
    ];
    return allResults
        .where(
            (result) => result.toLowerCase().contains(searchTerm.toLowerCase()))
        .toList();
  }
}
