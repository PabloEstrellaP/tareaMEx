import 'package:flutter/material.dart';

import 'package:ejemplo_consumo/router/routers.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consumo api',
      initialRoute: 'login',
      routes: appRoutes,
    );
  }
}
