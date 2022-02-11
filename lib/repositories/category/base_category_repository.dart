import 'package:githubexample/models/models.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
