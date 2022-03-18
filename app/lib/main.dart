import 'package:app/pages/home/home.dart';
import 'package:app/routes.dart';
import 'package:app/themes/theme.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Epitech Project',
      theme: theme(),
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}
