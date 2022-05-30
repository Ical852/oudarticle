//@dart=2.9

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oudarticle/models/payment_model.dart';
import 'package:oudarticle/shared/theme.dart';

class PaymentService {
  Future<PaymentModel> transaction({
    String order_id,
    String gross_amount,
    int user_id,
    int article_id
  }) async {
    var url = "$baseUrl/transactions";
    var headers = {"Content-Type": "application/json"};
    var body = jsonEncode({
      "order_id" : order_id,
      "gross_amount" : gross_amount,
      "user_id" : user_id,
      "article_id": article_id,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body
    );

    var data = jsonDecode(response.body)['data'];
    PaymentModel payment = PaymentModel.fromJson(data);

    return payment;
  }
}