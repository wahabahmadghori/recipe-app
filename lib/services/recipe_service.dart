import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:recipes_app/model/recipe_model.dart';
class RecipeService{
  Future<List<RecipeModel>> GetRecipesList() async{
    print('Staring');
    List<RecipeModel> recipes = [];
    try{
      final response = await http.get(Uri.parse('https://loving-nervous-guitar.anvil.app/_/api/recipes/list'),headers: {
        HttpHeaders.contentTypeHeader:"application/json"
      });
      if(response.statusCode == 200){
        final items = response.body;
        recipes = RecipeModelFromJson(items);
        print(recipes);
      }
      else{
        print("erro");
      }

    }catch(e){
      print(e);
    }
    return recipes;
  }
}