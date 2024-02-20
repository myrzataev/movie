import 'package:dio/dio.dart';
import 'package:movie_app/modules/home/data/models/all_films_model.dart';

class GetAllFilmsRepo {
  GetAllFilmsRepo({required this.dio});
  Dio dio;
  Future<AllFimsModel> getAllFilmsRepo() async {
    final Response response = await dio.get("/search");
    return AllFimsModel.fromJson(response.data);
  }
}
