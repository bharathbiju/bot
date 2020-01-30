import 'package:flutter/material.dart';

import 'router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat bot',
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}
