import 'package:auto_route/auto_route.dart';
import 'package:using_slivers_rhythm/youtube/app/slivers_rhythm/v3_auto_router/features/home/view/home_screen.dart';

import '../features/favorites/view/favorites_screen.dart';
import '../features/history/view/view.dart';
import '../features/home/view/view.dart';
import '../features/search/view/view.dart';
import '../features/settings/view/view.dart';

part 'router.gr.dart';

// flutter pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: SearchRoute.page,
              path: 'search',
            ),
            AutoRoute(
              page: FavoritesRoute.page,
              path: 'favorites',
            ),
            AutoRoute(
              page: HistoryRoute.page,
              path: 'poems',
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: 'settings',
            ),
          ],
        ),
      ];
}
