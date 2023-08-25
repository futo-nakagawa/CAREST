import 'package:flutter/material.dart';
import 'package:carest_app/screens/login/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carest_app/screens/tutorial_screen/tutorial_screen.dart';
import 'package:carest_app/screens/time_setting_screen/time_setting_screen.dart';
import 'package:carest_app/screens/time_setting_screen/test.dart';

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
      home: TimeSettingScreen(),
    );
  }
}
