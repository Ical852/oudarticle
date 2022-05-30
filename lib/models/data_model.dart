//@dart=2.9

import 'package:oudarticle/models/article_model.dart';
import 'package:oudarticle/models/category_model.dart';
import 'package:oudarticle/models/image_model.dart';

class DataModel {
  ArticleModel articles;
  CategoryModel category;
  List<ImageModel> images;

  DataModel.fromJson(Map<String, dynamic> json) {
    articles = ArticleModel.fromJson(json['articles']);
    category = CategoryModel.fromJson(json['category']);
    images = json['image'].map<ImageModel>((image) => ImageModel.fromJson(image)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "articles": articles.toJson(),
      "category": category.toJson(),
      "images": images.map((image) => image.toJson()).toList(),
    };
  }
}