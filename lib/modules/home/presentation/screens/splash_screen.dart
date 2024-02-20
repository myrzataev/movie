import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:auto_route/auto_route.dart' as auto_route;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/home/core/config/routes/app_router.gr.dart';
import 'package:movie_app/resources/resources.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: FlutterSplashScreen.fadeIn(
              backgroundColor: Color(0xff1F1D2B),
              onInit: () {
                debugPrint("On Init");
              },
              onEnd: () {
                debugPrint("On End");
              },
              childWidget: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(Images.splashPhoto),
              ),
              onAnimationEnd: () {
                context.router.replace(HomeRoute());
              }
              // nextScreen: aut
              ),
        )
      ]),
    );
  }
}
