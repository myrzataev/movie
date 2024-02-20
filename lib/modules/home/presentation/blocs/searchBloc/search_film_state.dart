part of 'search_film_bloc.dart';


abstract class SearchFilmState {}

final class SearchFilmInitial extends SearchFilmState {}
final class SearchFilmILoading extends SearchFilmState {}

final class SearchFilmSuccess extends SearchFilmState {
  SearchFilmModel model;
  SearchFilmSuccess({required this.model});
}

final class SearchFilmError extends SearchFilmState {
  String errorText;
  SearchFilmError({required this.errorText});
}

