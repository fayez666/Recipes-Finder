import 'package:equatable/equatable.dart';
import 'package:recipes_finder/data/models/ingredient.dart';

// ignore: must_be_immutable
class Recipe extends Equatable {
  int? id;
  final String? label;
  final String? image;
  final String? url;

  List<Ingredient>? ingredients;
  final double? calories;
  final double? totalWeight;
  final double? totalTime;

  Recipe({
    this.id,
    this.label,
    this.image,
    this.url,
    this.ingredients,
    this.calories,
    this.totalWeight,
    this.totalTime,
  });

  @override
  List<Object?> get props => [
        id,
        label,
        image,
        url,
        ingredients,
        calories,
        totalWeight,
        totalTime,
      ];
}
