//@dart=2.9

class ImageModel {
  int id;
  int article_id;
  String image_url;

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    article_id = json['article_id'];
    image_url = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "article_id": article_id,
      "image_url": image_url,
    };
  }
}