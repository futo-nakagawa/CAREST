import 'package:flutter/material.dart';
import 'package:carest_app/screens/login/login_screen.dart';
import 'package:carest_app/screens/login/test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Zen-M',
      ),
      home: LoginPage(),
    );
  }
}
