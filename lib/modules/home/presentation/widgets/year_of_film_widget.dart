
import 'package:flutter/material.dart';

class CustomYearOfFilmWidget extends StatelessWidget {
  final String year;
  const CustomYearOfFilmWidget({
    super.key,
    required this.year
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_month,
            size: 16,
            color: Colors.white60,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10),
            child: Text(
              year,
              style: const TextStyle(
                  color: Colors.white60),
            ),
          )
        ],
      ),
    );
  }
}
