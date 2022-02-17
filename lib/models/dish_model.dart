class DishModel {
  String? restaurantId;
  String? dishId;
  String? dishName;
  num? dishCost;
  String? dishContents;
  DishModel(
      {this.restaurantId,
      this.dishId,
      this.dishName,
      this.dishCost,
      this.dishContents});

  Map<String, dynamic> toMap() {
    return {
      'restaurantId': restaurantId,
      'dishId': dishId,
      'dishName': dishName,
      'dishCost': dishCost,
      'dishContents': dishContents,
    };
  }
}
