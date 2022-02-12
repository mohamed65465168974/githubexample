part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {}

class UpdateCategory extends CategoryEvent {
  final List<Category> categories;
  UpdateCategory(this.categories);
  List<Object> get props => [categories];
}
