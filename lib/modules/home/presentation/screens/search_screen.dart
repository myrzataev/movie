import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/home/data/models/get_film_by_search_model.dart';
import 'package:movie_app/modules/home/presentation/blocs/getAllFilmsBloc/get_all_films_bloc.dart';
import 'package:movie_app/modules/home/presentation/blocs/searchBloc/search_film_bloc.dart';
import 'package:movie_app/modules/home/presentation/widgets/custom_genre_of_film.dart';
import 'package:movie_app/modules/home/presentation/widgets/custom_text_field.dart';
import 'package:movie_app/modules/home/presentation/widgets/longtity_of_film_custom_widget.dart';
import 'package:movie_app/modules/home/presentation/widgets/profile_widget.dart';
import 'package:movie_app/modules/home/presentation/widgets/year_of_film_widget.dart';
import 'package:movie_app/resources/resources.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<GetAllFilmsBloc>(context).add(GetListOfFilmsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ProfileWidget(),
          CustomTextField(
            onChanged: (value) {
              if (value.isEmpty == false) {
                BlocProvider.of<SearchFilmBloc>(context)
                    .add(SearchByNameEvent(nameOfFilm: value));
              } else {
                BlocProvider.of<GetAllFilmsBloc>(context)
                    .add(GetListOfFilmsEvent());
              }
            },
            controller: controller,
          ),
          BlocConsumer<GetAllFilmsBloc, GetAllFilmsState>(
              builder: (context, state) {
                if (state is GetAllFilmsLoading) {
                  return const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 250),
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.white,
                    ),
                  );
                } else if (state is GetAllFilmsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.model.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(children: [
                                    Image.network(
                                      state.model.docs[index].poster.url,
                                      height: 147,
                                      width: 130,
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 6,
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 2.0, sigmaY: 2.0),
                                          child: Container(
                                            height: 24,
                                            width: 55,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xff252836)
                                                    .withOpacity(0.32)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  Images.star,
                                                  height: 16,
                                                  width: 16,
                                                ),
                                                Text(
                                                  state.model.docs[index].rating
                                                      .filmCritics
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Color(0xffFF8700),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            height: 20,
                                            width: 180,
                                            child: Text(
                                              state.model.docs[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        // Spacer(),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_outlined,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                    CustomYearOfFilmWidget(
                                      year: state.model.docs[index].year
                                          .toString(),
                                    ),
                                    LongtityOfFilm(
                                      longtity: state
                                          .model.docs[index].movieLength
                                          .toString(),
                                    ),
                                    GenreOfFilmWidget(
                                      genre: state
                                          .model.docs[index].genres.first.name,
                                      type: state.model.docs[index].type
                                                  .toString() ==
                                              "Type.MOVIE"
                                          ? "Фильм"
                                          : "Сериал",
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  );
                }
                return SizedBox.shrink();
              },
              listener: (context, state) {})
        ]),
      ),
    );
  }
}