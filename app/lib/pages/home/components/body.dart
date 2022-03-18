import 'package:app/pages/Itemlist/itemlist.dart';
import 'package:flutter/material.dart';

import '../../itemdetails/itemdetails.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center (
          child: TextButton(
            child: Text('redirect to Item List screen'),
            onPressed: () {Navigator.pushNamed(context, ItemListPage.routeName);},
          ),
        )
    );

  }
}