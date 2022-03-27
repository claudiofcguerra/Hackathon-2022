import 'package:hackathon_2022/recipeclass.dart';
import 'package:hackathon_2022/userclass.dart';

class Post {
  int id;
  User user;
  RecipeClass recipe;
  DateTime date;
  List<String> comments;

  Post(this.id, this.user, this.recipe, this.date, this.comments);

  Post.fromJSON(Map<String, dynamic> json)
  : id = json['id'],
    user = json['user'],
    recipe = json['recipe'],
    date = json['date'],
    comments = json['coments'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'recipe': recipe,
    'date': date,
    'comments': comments
  };
}