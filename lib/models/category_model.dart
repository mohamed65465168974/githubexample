import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  const Category({required this.name, required this.imageUrl});
  @override
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    Category category =
        Category(name: snapshot['name'], imageUrl: snapshot['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(
        name: 'soft drink',
        imageUrl:
            'https://www.thespruceeats.com/thmb/LHQcA-aMyrKhTsFhfmHxqkgz6CI=/4000x2666/filters:fill(auto,1)/greyhound-cocktail-recipe-759306-hero-01-680428b9f8d24389a2b547a52f3c279d.jpg'),
    Category(
        name: 'hard drink',
        imageUrl:
            'https://info.ehl.edu/hubfs/Blog-EHL-Insights/Blog-Header-EHL-Insights/trends%20drinks.jpg'),
    Category(
        name: 'medium drink',
        imageUrl:
            'https://static01.nyt.com/images/2019/05/15/dining/09spritz1/merlin_141351063_e6829ad6-f61c-435a-b6c3-87526a0613ef-superJumbo.jpg'),
  ];
}
