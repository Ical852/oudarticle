//@dart=2.9

class PaymentModel {
  int id;
  String order_id;
  String gross_amount;
  String payment_url;
  int user_id;
  int article_id;

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order_id = json['order_id'];
    gross_amount = json['gross_amount'];
    payment_url = json['payment_url'];
    user_id = json['user_id'];
    article_id = json['article_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "order_id": order_id,
      "gross_amount": gross_amount,
      "payment_url": payment_url,
      "user_id": user_id,
      "article_id": article_id,
    };
  }
}