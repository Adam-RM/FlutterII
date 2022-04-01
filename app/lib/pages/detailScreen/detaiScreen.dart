import 'package:app/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app/Models/RecipeModel.dart';
import 'package:app/pages/Itemlist/itemlist.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.holder}) : super(key: key);
  final int holder;
  static String routeName = '/detailScreen';
  @override
  Widget build(BuildContext context) {
    List<RecipeModel> data = ApiBloc.of(context)!.getRecipes();
    ListView listView = ListView.builder(itemCount: ApiBloc.of(context)!.getRecipes()[holder].steps.length,
      itemBuilder: (BuildContext context, int index) {
      return  Text(data[holder].steps[index]);
              });
    return Scaffold(  appBar: AppBar(
    title: const Text("Detail Screen"),
      ),
      body:Stack(
        children: [
           ListView(
            children: [
               Image.network(data[holder].imageUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    data[holder].name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Text(data[holder].desc),
              Text(data[holder].id),
              Text(data[holder].note),
              // listView,



              // ListView.builder(itemCount: ApiBloc.of(context)!.getRecipes().length,
              // itemBuilder: (BuildContext context, int index) {
              // return  Text(data[holder].ingredients[index].name + "Quantity = " + data[holder].ingredients[index].amount + " " + data[holder].ingredients[index].unit);
              // }),
              // Text(data[holder].ingredients[1].name)
              // Text(snapshot.data![holder].desc),Text(snapshot.data![holder].ingredients[0].name)
            ],
          )
          // ;})
          ,
          Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                child:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 25),
                onTap: (){Navigator.pushNamed(context, ItemListPage.routeName);}
              )),
        ],
      )
      );
  }
}