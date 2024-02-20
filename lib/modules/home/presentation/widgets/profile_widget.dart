
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.1448711260.1706918400&semt=ais"),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello, Smith",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text(
                    "Let’s stream your favorite movie",
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.favorite_outlined,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
