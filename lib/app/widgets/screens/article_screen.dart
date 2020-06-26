import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/blocs/article_bloc.dart';
import 'package:flutter_pepper/app/widgets/components/template.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ArticleBloc>(
      builder: (context) => ArticleBloc(),
      child: Template(),
      dispose: (context, value) => value.dispose(),
    );
  }
}