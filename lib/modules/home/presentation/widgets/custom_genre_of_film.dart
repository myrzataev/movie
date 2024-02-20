
import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class GenreOfFilmWidget extends StatelessWidget {
  final String genre;
  final String type;
  const GenreOfFilmWidget({
    super.key,
    required this.genre,
    required this.type
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Image.asset(
            Images.genre,
            height: 16,
            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 5, right: 5),
            child: Text(
              genre,
              style: TextStyle(
                  color: Colors.white60),
            ),
          ),
          Image.asset(
            Images.divider,
            height: 15,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 5),
            child: Text(
              type,
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
