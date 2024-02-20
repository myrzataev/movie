import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/home/core/config/routes/app_router.dart';
import 'package:movie_app/modules/home/core/network/diosettings.dart';
import 'package:movie_app/modules/home/data/repositories/get_film_by_search.dart';
import 'package:movie_app/modules/home/data/repositories/get_list_of_all_films.dart';
import 'package:movie_app/modules/home/presentation/blocs/getAllFilmsBloc/get_all_films_bloc.dart';
import 'package:movie_app/modules/home/presentation/blocs/searchBloc/search_film_bloc.dart';
import 'package:movie_app/modules/home/presentation/widgets/textfield_unfocus.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => DioSettings()),
        RepositoryProvider(
            create: (context) => GetFilmBySearchRepo(
                dio: RepositoryProvider.of<DioSettings>(context).dio)),
        RepositoryProvider(
            create: (context) => GetAllFilmsRepo(
                dio: RepositoryProvider.of<DioSettings>(context).dio))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchFilmBloc(
                repository:
                    RepositoryProvider.of<GetFilmBySearchRepo>(context)),
          ),
          BlocProvider(
            create: (context) => GetAllFilmsBloc(
                repo: RepositoryProvider.of<GetAllFilmsRepo>(context)),
          ),
        ],
        child: TextFieldUnfocus(
          child: MaterialApp.router(
            theme: ThemeData(scaffoldBackgroundColor: Color(0xff1F1D2B)),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter().config(),
          ),
        ),
      ),
    );
  }
}
