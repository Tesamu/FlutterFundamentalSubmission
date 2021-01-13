import 'dart:convert';

import 'menus.dart';

class Restaurants {
  Restaurants({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    pictureId = json["pictureId"];
    city = json["city"];
    rating = json["rating"].toDouble();
    menus = Menus.fromJson(json["menus"]);
  }
}

List<Restaurants> parseRestaurants(String json) {
  if (json == null) {
    return [];
  }
  final Map<String, dynamic> parsed = jsonDecode(json);
  return parsed["restaurants"].map<Restaurants>((json) =>
      Restaurants.fromJson(json)).toList();
}