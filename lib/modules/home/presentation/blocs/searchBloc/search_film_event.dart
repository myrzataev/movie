part of 'search_film_bloc.dart';

@immutable
sealed class SearchFilmEvent {}

class SearchByNameEvent extends SearchFilmEvent{
  final String nameOfFilm;
  SearchByNameEvent({required this.nameOfFilm});
}
