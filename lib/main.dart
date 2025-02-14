import 'package:database_hive_app/data_hive/general_box.dart';
import 'package:database_hive_app/screen_dasbhoard.dart';
import 'package:flutter/material.dart';

void main() async {
  await GeneralBox.getHiveFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ScreenDasbhoard(),
    );
  }
}
