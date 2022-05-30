//@dart=2.9

import 'dart:convert';

import 'package:oudarticle/models/data_model.dart';
import 'package:oudarticle/shared/theme.dart';
import 'package:http/http.dart' as http;

class ArticleService {

  Future<List<DataModel>> getArticles() async {
    var url = "$baseUrl/articles";
    var header = {
      "Content-Type": "application/json"
    };

    var response = await http.get(url, headers: header);
    List data = jsonDecode(response.body)['data'];
    List<DataModel> articles = [];
    for (var item in data) {
      articles.add(DataModel.fromJson(item));
    }

    return articles;
  }
}