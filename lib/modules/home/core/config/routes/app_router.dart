import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
            page: HomeRoute.page,
            title: (context, data) => "Home Page Router",
            children: [
              AutoRoute(page: MyProfileRoute.page),
              AutoRoute(page: FavouritesRoute.page),
              AutoRoute(page: SearchRoute.page)
            ]),
      ];
}
