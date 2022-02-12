import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:githubexample/models/models.dart';
import 'package:githubexample/repositories/category/category_repository.dart';
import '../../models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  /// initialize instance variables in the subclass,
  /// the super() call must be last in an initializer list.
  /// Named optional parameters can't start with an underscore
  /// so syntatic sugar constructor can not be called here
  /// [categoryRepository] will be initialized in [main.dart] when making object of the bloc

  CategoryBloc(CategoryRepository categoryRepository)
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategory>(_onUpdateCategories);
  }

  void _onLoadCategories(
      LoadCategories event, Emitter<CategoryState> emit) async {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (categories) => add(
            UpdateCategory(categories),
          ),
        );
  }

  void _onUpdateCategories(UpdateCategory event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
