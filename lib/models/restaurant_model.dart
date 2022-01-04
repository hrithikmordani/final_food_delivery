import 'dish_model.dart';

class RestaurantModel {
  int? id;
  String? name;
  String? location;
  String? cuisine;
  String? imageSource;
  List<DishModel>? dishes;
  RestaurantModel(
      {this.id,
      this.name,
      this.location,
      this.cuisine,
      this.imageSource,
      this.dishes});
}
