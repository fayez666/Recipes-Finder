import 'package:flutter/material.dart';
import 'repository.dart';

import 'models/models.dart';

class MemoryRepository extends Repository with ChangeNotifier {
  final List<Recipe> _currentRecipes = [];
  final List<Ingredient> _currentIngredients = [];
  @override
  List<Recipe> findAllRecipes() {
    return _currentRecipes;
  }

  @override
  Recipe findRecipeById(int id) {
    return _currentRecipes.firstWhere((recipe) => recipe.id == id);
  }

  @override
  List<Ingredient> findAllIngredients() {
    return _currentIngredients;
  }

  @override
  List<Ingredient> findRecipeIngredients(int recipeId) {
    final recipe =
        _currentRecipes.firstWhere((recipe) => recipe.id == recipeId);
    final recipeIngredients = _currentIngredients.where((ingredient) {
      return ingredient.recipeId == recipe.id;
    }).toList();
    return recipeIngredients;
  }

  @override
  int insertRecipe(Recipe recipe) {
    _currentRecipes.add(recipe);
    if (recipe.ingredients != null) {
      insertIngredients(recipe.ingredients!);
    }
    notifyListeners();
    return 0;
  }

  @override
  List<int> insertIngredients(List<Ingredient> ingredients) {
    if (ingredients.isNotEmpty) {
      _currentIngredients.addAll(ingredients);
      notifyListeners();
    }
    return [];
  }

  @override
  void deleteRecipe(Recipe recipe) {
    _currentRecipes.remove(recipe);
    if (recipe.ingredients != null) {
      deleteRecipeIngredients(recipe.id!);
    }
    notifyListeners();
  }

  @override
  void deleteIngredient(Ingredient ingredient) {
    _currentIngredients.remove(ingredient);
  }

  @override
  void deleteIngredients(List<Ingredient> ingredients) {
    _currentIngredients.removeWhere((ingredient) {
      return ingredients.contains(ingredient);
    });
    notifyListeners();
  }

  @override
  void deleteRecipeIngredients(int recipeId) {
    _currentIngredients.removeWhere((ingredient) {
      return ingredient.recipeId == recipeId;
    });
    notifyListeners();
  }

  @override
  Future init() {
    return Future.value();
  }

  @override
  void close() {}
}
