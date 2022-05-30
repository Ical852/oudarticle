import 'package:flutter/material.dart';
import 'package:oudarticle/models/data_model.dart';
import 'package:oudarticle/pages/detail_page.dart';
import 'package:oudarticle/shared/theme.dart';

class MainArticleItem extends StatelessWidget {

  DataModel article;

  MainArticleItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) => DetailPage(article)
          )
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12, bottom: 32),
            height: 275,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("http://10.0.2.2:8000/assets/" + article.images[0].image_url.toString()),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: Offset(0, 3))
              ]
            ),
          ),
          Container(
            height: 275,
            width: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.white.withOpacity(0),
                Color(0xff191410).withOpacity(0.25),
                Color(0xff191410).withOpacity(0.45),
                Color(0xff191410).withOpacity(0.65),
                Color(0xff191410).withOpacity(0.95),
              ]),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Container(
            height: 275,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.only(
                  left: 16,
                  bottom: 20,
                  right: 16
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.articles.title,
                      style: primaryTextStyle.copyWith(
                        color: Color(0xffF7F8F8),
                        fontSize: 14
                      ),
                    ),
                    SizedBox(height: 2,),
                    Text(
                      article.articles.body,
                      style: primaryTextStyle.copyWith(
                        color: Color(0xffF7F8F8),
                        fontSize: 12
                      ),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ),
          ),
      ]),
    );
  }
}