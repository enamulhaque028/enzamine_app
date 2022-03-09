import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.category,
  });

  final List<Category> category;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    category: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    required this.uuid,
    required this.name,
    required this.slug,
    required this.image,
  });

  final String? uuid;
  final String? name;
  final String? slug;
  final String? image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    uuid: json["uuid"] ?? '',
    name: json["name"] ?? '',
    slug: json["slug"] ?? '',
    image: json["image"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid!,
    "name": name!,
    "slug": slug!,
    "image": image!,
  };
}
