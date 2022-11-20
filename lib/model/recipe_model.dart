import 'dart:convert';

List<RecipeModel> RecipeModelFromJson(String str) => List<RecipeModel>.from(json.decode(str).map((x) => RecipeModel.fromJson(x)));

String RecipeModelToJson(List<RecipeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecipeModel {
  RecipeModel({
    required this.id,
    required this.recipe,
    required this.imgUrl,
  });

  int id;
  String recipe;
  String imgUrl;

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
    id: json["id"],
    recipe: json["recipe"],
    imgUrl: json["img_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "recipe": recipe,
    "img_url": imgUrl,
  };
}
