import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/home/data/models/get_film_by_search_model.dart';
import 'package:movie_app/modules/home/data/repositories/get_film_by_search.dart';

part 'search_film_event.dart';
part 'search_film_state.dart';

class SearchFilmBloc extends Bloc<SearchFilmEvent, SearchFilmState> {
  SearchFilmBloc({required this.repository}) : super(SearchFilmInitial()) {
    on<SearchByNameEvent>((event, emit) async {
      emit(SearchFilmILoading());
      try {
        var result = await repository.searchFilm(event.nameOfFilm);
        emit(SearchFilmSuccess(model: result));
      } catch (e) {
        if (e is DioException) {
          emit(SearchFilmError(errorText: e.message ?? ""));
        } else {
          emit(SearchFilmError(errorText: e.toString()));
        }
      }
    }
    );
  }
  GetFilmBySearchRepo repository;
}
