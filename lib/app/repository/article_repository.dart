import 'dart:convert';

import 'package:flutter_pepper/app/resorces/api/article_api.dart';
import 'package:flutter_pepper/app/resorces/models/model.dart';

class ArticleRepository {
  fetchArticleRepository() async {

    final String _requestArticleUrl = 'https://arthur-foreign.com/articles/1';

    final _articleResponse = await ArticleApiProvider().fetchArticleApi(_requestArticleUrl);

    if (_articleResponse.statusCode == 200) {
      final _decodedArticleResponse = await json.decode(_articleResponse.body);
      return Article.fromJson(_decodedArticleResponse);
    } else {
      throw Exception("Error");
    }
  }
}