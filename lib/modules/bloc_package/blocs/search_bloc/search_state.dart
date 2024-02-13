part of 'search_bloc.dart';

sealed class SearchState  {
  const SearchState();
  

}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<String> results;

  const SearchSuccess(this.results);


}


final class SearchFailure extends SearchState {
  final String error;

  const SearchFailure(this.error);


}