import 'package:animated_card/animated_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pepper/app/widgets/screens/article_screen.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Card Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListagemScreen(),
    );
  }
}

class ListagemScreen extends StatelessWidget {
  final lista = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Animation Example")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return AnimatedCard(
            direction: AnimatedCardDirection.left,
            //Initial animation direction
            initDelay: Duration(milliseconds: 0),
            //Delay to initial animation
            duration: Duration(seconds: 1),
            //Initial animation duration
//            onRemove: () => lista.removeAt(index), //Implement this action to active dismiss
            curve: Curves.bounceOut,
            //Animation curve
            child: GestureDetector(
              onTap: () {
                print("Takishita tap");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ArticleScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    title: Container(
                      height: 150,
                      child: Center(child: Text("$index")),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
//void main() {
//  runApp(
//    /// Providers are above [MyApp] instead of inside it, so that tests
//    /// can use [MyApp] while mocking the providers
//    MultiProvider(
//      providers: [
//        ChangeNotifierProvider(create: (_) => Counter()),
//      ],
//      child: MyApp(),
//    ),
//  );
//}
//
///// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
//class Counter with ChangeNotifier, DiagnosticableTreeMixin {
//  int _count = 0;
//  int get count => _count;
//
//  void increment() {
//    _count--;
//    notifyListeners();
//  }
//
//  /// Makes `Counter` readable inside the devtools by listing all of its properties
//  @override
//  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//    super.debugFillProperties(properties);
//    properties.add(IntProperty('count', count));
//  }
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return const MaterialApp(
//      home: MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//  const MyHomePage({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Example'),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            const Text('You have pushed the button this many times:'),
//
//            /// Extracted as a separate widget for performance optimization.
//            /// As a separate widget, it will rebuild independently from [MyHomePage].
//            ///
//            /// This is totally optional (and rarely needed).
//            /// Similarly, we could also use [Consumer] or [Selector].
//            const Count(),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
//        /// when [Counter] changes.
//        onPressed: () => context.read<Counter>().increment(),
//        tooltip: 'Increment',
//        child: const Icon(Icons.add),
//      ),
//    );
//  }
//}
//
//class Count extends StatelessWidget {
//  const Count({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Text(
//
//      /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
//        '${context.watch<Counter>().count}',
//        style: Theme.of(context).textTheme.headline4);
//  }
//}
