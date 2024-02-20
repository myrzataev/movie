part of 'get_all_films_bloc.dart';

@immutable
sealed class GetAllFilmsState {}

final class GetAllFilmsInitial extends GetAllFilmsState {}

final class GetAllFilmsLoading extends GetAllFilmsState {}
final class GetAllFilmsSuccess extends GetAllFilmsState {
  final AllFimsModel model;
  GetAllFilmsSuccess({required this.model});
}
final class GetAllFilmsError extends GetAllFilmsState {
  final String errorText;
  GetAllFilmsError({required this.errorText});
}
