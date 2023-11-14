import 'dart:convert';
import 'recipe_page.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "a0967354f5msh8960fae259804c4p1573c9jsn705dd5bf70c1",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List temp = [];
    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(temp);
  }
}