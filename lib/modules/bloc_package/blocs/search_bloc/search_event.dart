part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchTermChanged extends SearchEvent {
  final String term;
  SearchTermChanged({required this.term});
}
