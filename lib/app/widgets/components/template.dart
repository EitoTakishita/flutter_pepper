import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/blocs/article_bloc.dart';
import 'package:provider/provider.dart';

class Template extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ArticleBloc _bloc = Provider.of<ArticleBloc>(context);
    return Scaffold(
        body: Container(
          child: StreamBuilder(
            stream: _bloc.articleInitialStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                      children: <Widget>[
                        // ここで、Organisms層のComponentを呼び出す
                        // snapshot.data.xxxxのような形で受け取ったオブジェクトを描画
                      ]
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        )
    );
  }
}