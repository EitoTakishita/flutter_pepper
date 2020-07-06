import 'package:flutter_pepper/app/repository/article_repository.dart';
import 'package:flutter_pepper/app/resorces/models/model.dart';
import 'package:rxdart/rxdart.dart';

class ArticleBloc {
  // ObserverとStreamを継承したSubjectを定義
  final _articleInitialPublishSubject = PublishSubject<Results>();

  ArticleBloc() {
    fetchArticle();
  }

  // Streamは連続したObserverの配列みたいなものを定義
  Stream<Results> get articleInitialStream =>
      _articleInitialPublishSubject.stream;

  // StreamにObserverをaddするためのアクセッサを定義
  Sink<Results> get articleInitialSink => _articleInitialPublishSubject.sink;

  // Repository層を経由してRequest
  void fetchArticle() async {
    final _articleResponse = await ArticleRepository().fetchArticleRepository();
    articleInitialSink.add(_articleResponse);
  }

  void dispose() {
    _articleInitialPublishSubject.close();
  }
}
