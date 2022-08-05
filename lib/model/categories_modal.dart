import 'package:flutter/material.dart';

// class Category {
//   int id;
//   String name;
//
//   Category({required this.id, required this.name});
//
//   // factory Category.fromJson(Map<Stri>)
// }

import 'dart:convert';

// List<CategoryMovies> categoryMoviesFromMap(String str) =>
//     List<CategoryMovies>.from(
//         json.decode(str).map((x) => CategoryMovies.fromMap(x)));
//
// String categoryMoviesToMap(List<CategoryMovies> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
//
// class CategoryMovies {
//   CategoryMovies({
//     required this.id,
//     required this.name,
//   });
//
//   int id;
//   String name;
//
//   factory CategoryMovies.fromMap(Map<String, dynamic> json) => CategoryMovies(
//         id: json["id"],
//         name: json["name"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "name": name,
//       };
// }

class CategoryMovies {
  int id;
  String name;
  String descriptions;

  CategoryMovies({
    required this.id,
    required this.name,
    required this.descriptions,
  });

  factory CategoryMovies.fromJson(Map<String, dynamic> json) {
    return CategoryMovies(
        id: json['id'], name: json['name'], descriptions: json['descriptions']);
  }
}
