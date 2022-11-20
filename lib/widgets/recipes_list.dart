import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/provider/recipe_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:extended_image/extended_image.dart';
class RecipesList extends StatefulWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  @override
  void initState() {
    Provider.of<RecipeProvider>(context, listen: false).getRecipesList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(builder: (context, recipe, child) {
      return recipe.loading?ListView.builder(
          itemCount: recipe.recipes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  child: Column(
                    children: [
                      ExtendedImage.network(
                        recipe.recipes[index].imgUrl,
                        height: 250,
                        fit: BoxFit.fill,
                        cache: true,
                        //cancelToken: cancellationToken,
                      ),
                      Text(
                        recipe.recipes[index].recipe,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }):SpinKitThreeBounce(color: Colors.blue,);
    });
  }
}
