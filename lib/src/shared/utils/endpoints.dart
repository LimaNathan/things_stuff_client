class Endpoints {
  static const String _baseURL = String.fromEnvironment('BASE_URL');
  static const String _thingsURL = '$_baseURL/things';
  static const String _categoriesURL = '$_baseURL/categories';

  ///Things
  static String get getAllThings => _thingsURL;
  static String get createNewThing => _thingsURL;
  static String get getThingByID => _thingsURL;
  static String get updateThingByID => _thingsURL;
  static String get deleteThingByID => _thingsURL;

  /// Categories
  static String get getAllCategories => _categoriesURL;
  static String get createNewCategorie => _categoriesURL;
  static String get getCategorieByID => _categoriesURL;
  static String get updateCategorieByID => _categoriesURL;
  static String get deleteCategorieByID => _categoriesURL;
}
