import 'package:app/Models/RecipeModel.dart';
import 'package:app/pages/Itemlist/itemlist.dart';
import 'package:app/pages/detailScreen/detaiScreen.dart';
import 'package:app/pages/home/home.dart';
import 'package:app/pages/itemdetails/itemdetails.dart';
import 'package:app/pages/noconnection/noconnection.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.routeName: (context) => const HomePage(),
  ItemDetailsPage.routeName: (context) => const ItemDetailsPage(),
  ItemListPage.routeName: (context) => const ItemListPage(),
  NoConnectionPage.routeName: (context) => const NoConnectionPage(),
  DetailRecipes.routeName: (context) => DetailRecipes(
        recipe: RecipeModel(
            desc: '',
            name: '',
            forkef: '',
            id: '',
            imageUrl: '',
            ingredients: [],
            note: '',
            steps: [],
            tags: []),
      ),
};
