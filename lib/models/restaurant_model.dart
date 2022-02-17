import 'dish_model.dart';

class RestaurantModel {
  int? id;
  String? name;
  String? location;
  String? cuisine;
  String? imageSource;
  List<dynamic>? dishes;

  RestaurantModel(
      {this.id,
      this.name,
      this.location,
      this.cuisine,
      this.imageSource,
      this.dishes});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'cuisine': cuisine,
      'imageSource': imageSource,
      'dishes': dishes
    };
  }
}
