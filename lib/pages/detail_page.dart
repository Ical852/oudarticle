import 'package:flutter/material.dart';
import 'package:oudarticle/models/data_model.dart';
import 'package:oudarticle/models/userform_model.dart';
import 'package:oudarticle/pages/payment_page.dart';
import 'package:oudarticle/shared/theme.dart';
import 'package:oudarticle/widgets/custom_button.dart';
import 'package:oudarticle/widgets/header.dart';
import 'package:oudarticle/widgets/input_custom.dart';
import 'package:oudarticle/widgets/overview_item.dart';

class DetailPage extends StatefulWidget {

  DataModel article;
  DetailPage(this.article);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  var currentImage = "";

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController(text: "");
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController phoneNumberController = TextEditingController(text: "");
    TextEditingController amountController = TextEditingController(text: "");

    Future<void> showDonateDialog() async {
      return showDialog(
        context: context, 
        builder: (BuildContext context) {
          return Container(
            child: Dialog(
              insetPadding: EdgeInsets.all(24),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 530,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputCustom(
                        label: "Full Name",
                        hint: "Fill your fullname",
                        controller: nameController,
                      ),
                      InputCustom(
                        label: "Email",
                        hint: "Fill your email address",
                        controller: emailController,
                      ),
                      InputCustom(
                        label: "Phone Number",
                        hint: "Fill your phone number",
                        controller: phoneNumberController,
                      ),
                      InputCustom(
                          label: "Donate Amount",
                          hint: "Fill your donate amount",
                          controller: amountController,
                        ),
                      SizedBox(height: 16,),
                      Center(
                        child: Text(
                          "Fill the form for your donation",
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            color: Color(0xffADA8A4),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 14),
                      CustomButton(
                        title: "Donate", 
                        onpress: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                name: nameController.text,
                                email: emailController.text,
                                phone_number: phoneNumberController.text,
                                amount: amountController.text,
                                article: widget.article,
                              )
                            )
                          );
                        }
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      );
    }

    Widget overview() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Overview",
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: widget.article.images.map((image) => GestureDetector(
                onTap: (){
                  this.setState(() {
                    currentImage = "http://10.0.2.2:8000/assets/" + image.image_url;
                  });
                },
                child: OverviewItem(
                  image: "http://10.0.2.2:8000/assets/" + image.image_url),
              )).toList(),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              width: double.infinity,
              child: Image(
                image: AssetImage("assets/line.png"),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 32),
            CustomButton(
              title: "Donate to Author",
              onpress: (){
                showDonateDialog();
              },
            ),
            SizedBox(height: 24,)
          ],
        ),
      );
    }

    Widget articleDetails() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.article.articles.title,
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold
              ),
            ),
            SizedBox(height: 12,),
            Text(
              widget.article.articles.body,
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: reguler,
              ),
              textAlign: TextAlign.justify,
              maxLines: 10,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: 24,
          right: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(currentImage != "" ? currentImage : "http://10.0.2.2:8000/assets/" + widget.article.images[0].image_url),
                height: 293,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            articleDetails(),
            overview()
          ],
        ),
      );
    }
    
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            HeaderCustomed(
              title: "Details",
              onBack: (){
                Navigator.pop(context);
              },
            ),
            content()
          ],
        )
      ),
    );
  }
}