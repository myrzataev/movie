import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/modules/home/data/models/all_films_model.dart';
import 'package:movie_app/modules/home/data/repositories/get_list_of_all_films.dart';

part 'get_all_films_event.dart';
part 'get_all_films_state.dart';

class GetAllFilmsBloc extends Bloc<GetAllFilmsEvent, GetAllFilmsState> {
  GetAllFilmsBloc({required this.repo}) : super(GetAllFilmsInitial()) {
    on<GetAllFilmsEvent>((event, emit) async {
      emit(GetAllFilmsLoading());
      try {
        AllFimsModel result = await repo.getAllFilmsRepo();
        emit(GetAllFilmsSuccess(model: result));
      } catch (e) {
        emit(GetAllFilmsError(errorText: e.toString()));
      }
    });
  }
  GetAllFilmsRepo repo;
}
