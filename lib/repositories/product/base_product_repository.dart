import 'package:githubexample/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
