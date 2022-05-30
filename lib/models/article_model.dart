//@dart=2.9

class ArticleModel {
  int id;
  String title;
  String body;
  int category_id;

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    category_id = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "category_id": category_id,
    };
  }
}