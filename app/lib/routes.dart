import 'package:app/pages/Itemlist/itemlist.dart';
import 'package:app/pages/detailScreen/detaiScreen.dart';
import 'package:app/pages/home/home.dart';
import 'package:app/pages/itemdetails/itemdetails.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => const HomePage(),
  ItemDetailsPage.routeName: (context) => const ItemDetailsPage(),
  ItemListPage.routeName: (context) => const ItemListPage(),
  DetailScreen.routeName: (context) => const DetailScreen(holder: 0,),
};
