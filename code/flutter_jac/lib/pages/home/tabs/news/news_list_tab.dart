import 'package:flutter/material.dart';
import 'package:flutter_jac/models/article.dart';
import 'package:flutter_jac/pages/home/tabs/news/ui/news_card.dart';
import 'package:flutter_jac/provider/AsyncValueWidget.dart';
import 'package:flutter_jac/provider/article_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsListTab extends ConsumerWidget {
  const NewsListTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleList = ref.watch(articleListProvider);

    return AsyncValueWidget<List<Article>?>(
      value: articleList,
      data: (data) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: data!.length,
          itemBuilder: (_, int index) {
            return NewsCard(article: data[index]);
          },
        );
      },
    );
  }
}
