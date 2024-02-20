import 'package:dio/dio.dart';
import 'package:movie_app/modules/home/data/models/get_film_by_search_model.dart';

class GetFilmBySearchRepo {
  Dio dio;
  GetFilmBySearchRepo({required this.dio});
  Future<SearchFilmModel> searchFilm(String title) async {
    final Response response = await dio.get("/search?",
        queryParameters: {"page": 1, "limit": 10, "query": title});
    return SearchFilmModel.fromJson(response.data);
  }
}
