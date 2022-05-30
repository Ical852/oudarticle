import 'package:flutter/material.dart';
import 'package:oudarticle/models/data_model.dart';
import 'package:oudarticle/pages/detail_page.dart';
import 'package:oudarticle/shared/theme.dart';

class TileArticles extends StatelessWidget {

  DataModel article;

  TileArticles({required this.article});

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
      child: Container(
        margin: EdgeInsets.only(
          bottom: 16
        ),
        height: 90,
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, 1))
          ]
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage("http://10.0.2.2:8000/assets/" + article.images[0].image_url.toString()),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(width: 11,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.articles.title,
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    article.articles.body,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      color: Color(0xff7B756F),
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}