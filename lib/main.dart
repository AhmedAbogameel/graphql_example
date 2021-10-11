import 'package:flutter/material.dart';
import 'package:graphql_example/view.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: View(),
    );
  }
}