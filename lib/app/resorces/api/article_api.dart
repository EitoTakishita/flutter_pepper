class ArticleApiProvider {
  fetchArticleApi(String _requestArticleUrl) async {
    final _response = await http.get(_requestArticleUrl);
    return _response;
  }
}