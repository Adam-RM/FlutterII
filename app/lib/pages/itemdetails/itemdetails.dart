import 'package:flutter/material.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage ({Key? key}) : super(key: key);
  static String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Details"),
        leading: BackButton(
        color: Colors.black,
        onPressed: () => Navigator.pop(context),

    ),
      ),
      //body: const Body(),
    );
  }
}
