import 'package:flutter/material.dart';
import 'package:recipes_app/services/recipe_service.dart';
import '../model/recipe_model.dart';
class RecipeProvider extends ChangeNotifier{
  bool loading = false;
  List<RecipeModel> recipes = [];
  getRecipesList() async{
    recipes =  await RecipeService().GetRecipesList();
    loading = true;
    notifyListeners();
  }
}