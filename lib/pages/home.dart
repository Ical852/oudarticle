import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oudarticle/cubit/article_cubit.dart';
import 'package:oudarticle/models/data_model.dart';
import 'package:oudarticle/models/user_model.dart';
import 'package:oudarticle/services/articles_service.dart';
import 'package:oudarticle/services/payment_service.dart';
import 'package:oudarticle/services/user_service.dart';
import 'package:oudarticle/shared/theme.dart';
import 'package:oudarticle/widgets/main_articles_item.dart';
import 'package:oudarticle/widgets/tile_articles_item.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ArticleCubit>().getArticles();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 24, right: 24, left: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 2))
                  ]),
              child: Center(
                child: Image(
                  image: AssetImage("assets/ic_cat.png"),
                ),
              ),
            ),
            Text(
              "Ou `D Articles",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(0, 2))
                  ]),
              child: Center(
                child: Image(
                  image: AssetImage("assets/ic_notif.png"),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget searchBar() {
      return Container(
        margin: EdgeInsets.only(top: 32, right: 24, left: 24),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 42,
                margin: EdgeInsets.only(right: 11),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: Offset(0, 1))
                    ]),
                child: Row(
                  children: [
                    Image(image: AssetImage("assets/ic_search.png")),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                              hintText: "Search Articles You Like",
                              hintStyle: primaryTextStyle.copyWith(
                                  color: Color(0xffADA8A4),
                                  fontWeight: light,
                                  fontSize: 14)),
                        ),
                      ),
                    ),
                    Image(image: AssetImage("assets/ic_audio.png"))
                  ],
                ),
              ),
            ),
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Image(image: AssetImage("assets/ic_filter.png")),
              ),
            )
          ],
        ),
      );
    }

    Widget mainArticles(List<DataModel> articles) {
      return Container(
        margin: EdgeInsets.only(top: 32),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 24),
              Row(
                children: articles.map((article) => MainArticleItem(article: article)).toList(),
              ),
              SizedBox(width: 12),
            ],
          ),
        ),
      );
    }

    Widget tiletitle() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular",
              style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
            ),
            Text(
              "See More",
              style: primaryTextStyle.copyWith(
                  fontSize: 12, fontWeight: bold, color: Color(0xffADA8A4)),
            )
          ],
        ),
      );
    }

    Widget tileArticles(List<DataModel> articles) {
      return Container(
        margin: EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 80),
        child: Column(
          children: articles.map((article) => TileArticles(article: article)).toList(),
        ),
      );
    }

    return BlocBuilder<ArticleCubit, ArticleState>(
      builder: (context, state) {
        if (state is ArticleSuccess) {
          return ListView(
            children: [
              header(),
              searchBar(),
              mainArticles(state.articles),
              tiletitle(),
              tileArticles(state.articles)
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
