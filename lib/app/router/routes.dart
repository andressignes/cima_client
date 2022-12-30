enum Routes {
  home,
  lastAuthorized,
  supplyProblems,
  search,
  searchResult,
  settings,
  medicationDetail,
  ;

  String get path {
    switch (this) {
      case Routes.home:
        return '/';
      case Routes.lastAuthorized:
        return '/last-authorized';
      case Routes.supplyProblems:
        return '/supply-problems';
      case Routes.search:
        return '/search';
      case Routes.searchResult:
        return 'search-result';
      case Routes.settings:
        return '/settings';
      case Routes.medicationDetail:
        return '/medication-detail';
    }
  }
}
