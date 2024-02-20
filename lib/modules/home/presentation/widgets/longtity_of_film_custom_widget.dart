
import 'package:flutter/material.dart';
import 'package:movie_app/resources/resources.dart';

class LongtityOfFilm extends StatelessWidget {
  final String longtity;
  const LongtityOfFilm({
    super.key,
    required this.longtity
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(
            Images.layer2,
            height: 16,
            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 3, right: 3),
            child: Text(
              longtity,
              style: TextStyle(
                  color: Colors.white60),
            ),
          ),
          Text(
            "Минуты",
            style: TextStyle(
              color: Colors.white60,
            ),
          )
        ],
      ),
    );
  }
}
