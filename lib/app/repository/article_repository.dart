import 'dart:convert';

import 'package:flutter_pepper/app/resorces/api/article_api.dart';
import 'package:flutter_pepper/app/resorces/models/model.dart';

class ArticleRepository {
  Future<Shops> getShops() async {
    Shops shops = fetchArticleRepository();
    return shops;
  }

  fetchArticleRepository() async {
    final String _requestHotPepperUrl =
        'https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=96bbd4feacfd779d&format=json&large_area=Z011';

    final _articleResponse =
        await ArticleApiProvider().fetchArticleApi(_requestHotPepperUrl);

    if (_articleResponse.statusCode == 200) {
      print("response = ${json.decode(_articleResponse.body)}");
      final _decodedArticleResponse = await json.decode(_articleResponse.body);
      return Results.fromJson(_decodedArticleResponse);
    } else {
      throw Exception("Error");
    }
  }
}
