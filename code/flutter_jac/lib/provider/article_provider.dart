import 'package:flutter_jac/models/article.dart';
import 'package:flutter_jac/repository/news_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'article_provider.g.dart';

@riverpod
Future<List<Article>?> articleList(ArticleListRef ref) async {
  return NewsRepository().getArticleList();
}
