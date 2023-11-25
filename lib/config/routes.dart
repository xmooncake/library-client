enum Routes {
  login,
  loading,
  home,
  settings,
}

extension RoutesX on Routes {
  String get path {
    switch (this) {
      case Routes.home:
        return '/';
      case Routes.login:
        return '/login';
      case Routes.loading:
        return '/loading';
      case Routes.settings:
        return '/settings';
    }
  }
}
