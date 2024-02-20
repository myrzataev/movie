import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/home/core/config/routes/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const List<BottomNavigationBarItem> _bottomNavbarsItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline_outlined), label: "My Wish List"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Profile")
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [SearchRoute(), FavouritesRoute(), MyProfileRoute()],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        // iconSize: 15,
        backgroundColor: Color(0xff1F1D2B),
        items: _bottomNavbarsItems,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.lightBlueAccent
        ,
        currentIndex: tabsRouter.activeIndex,
        onTap: (int i) {
          tabsRouter.setActiveIndex(i);
        },
      ),
    );
  }
}
