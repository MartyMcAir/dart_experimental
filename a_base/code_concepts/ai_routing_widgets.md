# Routing Widgets - доя управления переходами по экранам
## При использовании flutter_bloc без подключения др библиотек для навигации доступны Navigator & Navigator 2

# Navigator
Описание: Базовый виджет Flutter для управления навигацией и историей навигации.
Преимущества:
Прямо встроен в Flutter.
Поддерживает базовую навигацию и управление историей экранов.

```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);
```

# Navigator 2
Описание: Расширенная версия Navigator с поддержкой декларативного подхода к навигации.
Преимущества:
Более гибкий и мощный, поддерживает управление маршрутизацией на уровне приложения.
Поддержка глубоких ссылок и навигации на основе состояния.
```
class MyRouterDelegate extends RouterDelegate<Page> with ChangeNotifier, PopNavigatorRouterDelegateMixin<Page> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(child: HomeScreen()),
        if (showDetails) MaterialPage(child: DetailsScreen()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {          return false;        }
        showDetails = false;
        notifyListeners();
        return true;
      },    );  }  }
```

# Fluro
Описание: Популярная библиотека маршрутизации для Flutter, обеспечивающая более удобную и мощную маршрутизацию.
Преимущества:
Простая в использовании.
Поддержка параметров маршрутов и анимаций переходов.
```
final router = FluroRouter();
router.define("/home", handler: Handler(handlerFunc: (context, parameters) => HomeScreen()));
router.define("/details/:id", handler: Handler(handlerFunc: (context, parameters) {
  final id = parameters["id"]?.first;
  return DetailsScreen(id: id);
}));

Navigator.pushNamed(context, "/details/1");
```

# AutoRoute
Описание: Мощная библиотека маршрутизации с автоматической генерацией маршрутов.
Преимущества:
Автоматическая генерация кода маршрутизации.
Поддержка вложенных маршрутов и защитников маршрутов (route guards).
```
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: DetailsScreen),
  ],
)
class $AppRouter {}
final appRouter = AppRouter();
appRouter.push(DetailsRoute(id: 1));
```

# Beamer
Описание: Библиотека маршрутизации для Flutter, которая использует Navigator 2.0 под капотом и обеспечивает декларативный подход к навигации.
Преимущества:
Поддержка Navigator 2.0.
Декларативный подход к маршрутизации.
Поддержка глубоких ссылок.
```
final routerDelegate = BeamerRouterDelegate(
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      HomeLocation(),
      DetailsLocation(),
    ],  ), );
MaterialApp.router(
  routerDelegate: routerDelegate,
  routeInformationParser: BeamerParser(), );
```

# GoRouter
Описание: Простой и мощный маршрутизатор для Flutter, разработанный с учетом удобства использования и совместимости с Navigator 2.0.
Преимущества:
Простая настройка и использование.
Поддержка глубоких ссылок, анимаций и маршрутов на основе состояния.
```
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/details/:id', builder: (context, state) {
      final id = state.params['id'];
      return DetailsScreen(id: id);
    }),  ], );
MaterialApp.router(
  routerDelegate: router.routerDelegate,
  routeInformationParser: router.routeInformationParser, );
```

