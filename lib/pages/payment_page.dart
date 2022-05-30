import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oudarticle/models/data_model.dart';
import 'package:oudarticle/models/payment_model.dart';
import 'package:oudarticle/models/user_model.dart';
import 'package:oudarticle/models/userform_model.dart';
import 'package:oudarticle/pages/success_page.dart';
import 'package:oudarticle/services/payment_service.dart';
import 'package:oudarticle/services/user_service.dart';
import 'package:oudarticle/shared/theme.dart';
import 'package:oudarticle/widgets/custom_button.dart';
import 'package:oudarticle/widgets/header.dart';
import 'package:oudarticle/widgets/payment_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {

  String name;
  String email;
  String phone_number;
  String amount;

  DataModel article;

  PaymentPage({
    required this.name, 
    required this.email, 
    required this.phone_number, 
    required this.amount, 
    required this.article}
  );

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  @override
  void initState() {
    super.initState();
  }

  var success = false;
  var payment_url = "";
  var payment_ongoing = false;

  @override
  Widget build(BuildContext context) {

    void paymentSuccess() {
      this.setState(() {
        payment_ongoing = false;
      });

      Timer(Duration(seconds: 1), () {
        Navigator.push(
          context,MaterialPageRoute(
            builder: (context) => SuccessPage()
          )
        );
      });
    }

    void payment() async {
      UserService userService = UserService();
      UserModel user = await userService.register(
        name: widget.name,
        email: widget.email,
        phone_number: widget.phone_number
      );

      PaymentService paymentService = PaymentService();
      PaymentModel payment = await paymentService.transaction(
        order_id: new Random().nextInt(100).toString(),
        gross_amount: widget.amount.toString(),
        user_id: user.id,
        article_id: widget.article.articles.id
      );

      this.setState(() {
        payment_url = payment.payment_url;
      });

      print(payment_url);

      this.setState(() {
        payment_ongoing = true;
      });
    }

    Widget paymentSummary() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Summary",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium
              ),
            ),
            SizedBox(height: 14),
            PaymentItem(
              label: "Full Name",
              value: widget.name,
            ),
            PaymentItem(
              label: "Email Address",
              value: widget.email,
            ),
            PaymentItem(
              label: "Phone Number",
              value: widget.phone_number,
            ),
            SizedBox(height: 2),
            Image(
              image: AssetImage("assets/line.png"),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium
                  ),
                ),
                Text(
                  "IDR " + widget.amount,
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            CustomButton(
              title: "Donate", 
              onpress: () {
                payment();
              }
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 3))
          ]
        ),
      );
    }

    Widget articleDetail() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCustomed(title: "Donate Payment", onBack: (){
              Navigator.pop(context);
            },),
            Container(
              margin: EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 3)
                  )
                ]
              ),
              height: 351,
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("http://10.0.2.2:8000/assets/"+ widget.article.images[0].image_url),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(14)
                ),
              ),
            ),
            SizedBox(),
            Container(
              margin: EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.article.articles.title,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text(
                    widget.article.articles.body,
                    maxLines: 3,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: reguler,
                      color: Color(0xffADA8A4)
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 24)
                ],
              ),
            )
          ],
        ),
      );
    }
    
    return payment_ongoing && payment_url != "" ? 
      Scaffold(
        appBar: AppBar(
          title: Text("Payment"),
          backgroundColor: Colors.grey,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,),
            onPressed: () {
              paymentSuccess();
            },
          ),
        ),
        body: WebView(
          initialUrl: payment_url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      )
    : Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            articleDetail(),
            paymentSummary()
          ],
        )
      )
    );
  }
}