import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oudarticle/models/article_model.dart';
import 'package:oudarticle/models/data_model.dart';
import 'package:oudarticle/services/articles_service.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  void getArticles() async {
    emit(ArticleLoading());
    List<DataModel> articles = await ArticleService().getArticles();
    emit(ArticleSuccess(articles));
  }
}
