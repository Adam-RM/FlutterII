import 'package:flutter/material.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({Key? key}) : super(key: key);
  static String routeName = '/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item List"),
      ),
      //body: const Body(),
    );
  }
}
