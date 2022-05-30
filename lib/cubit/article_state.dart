part of 'article_cubit.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleSuccess extends ArticleState {

  List<DataModel> articles;

  ArticleSuccess(this.articles);
  
  @override
  List<Object> get props => articles;
}