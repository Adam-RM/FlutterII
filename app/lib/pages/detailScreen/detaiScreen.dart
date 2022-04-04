import 'package:app/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app/Models/RecipeModel.dart';
import 'package:app/pages/Itemlist/itemlist.dart';

class DetailRecipes extends StatelessWidget {
  final RecipeModel recipe;
  static String routeName = '/detailScreen';

  const DetailRecipes({required this.recipe});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            ///First show the image in background
            Hero(
              child: Container(
                height: size.height * 0.55,
                child: Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              tag: recipe.imageUrl,
            ),

            ///Container for more content
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Text(
                                    recipe.name,
                                  ),
                                )),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.redAccent,
                              iconSize: 30,
                              onPressed: () {},
                            )
                          ],
                        ),
                        Text(
                          recipe.desc,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[400],
                              size: 15,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 24,
                        ),

                        ///Container for food information
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Ingredients",
                                      ),
                                      Text(
                                        recipe.ingredients!.length.toString(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 24,
                        ),

                        Text(
                          "Ingredients",
                        ),

                        Column(
                          children: <Widget>[
                            ListView.builder(
                              padding: EdgeInsets.only(top: 10),
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: recipe.ingredients!.length,
                              itemBuilder: (context, index) {
                                var ingredients = recipe.ingredients;
                                return Text(ingredients![index].amount != null
                                    ? ingredients[index].amount +
                                        (ingredients[index].unit ?? "") +
                                        " " +
                                        ingredients[index].name
                                    : "");
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),

                        Text(
                          "Cooking Method",
                        ),
                        Column(
                          children: <Widget>[
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              padding: EdgeInsets.only(top: 10),
                              itemCount: recipe.steps!.length,
                              itemBuilder: (context, index) {
                                return Text(recipe.steps![index]);
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


// class DetailScreen extends StatelessWidget {
//   const DetailScreen({Key? key, required this.holder}) : super(key: key);
//   final int holder;
//   static String routeName = '/detailScreen';
//   @override
//   Widget build(BuildContext context) {
//     List<RecipeModel> data = ApiBloc.of(context)!.getRecipes();
//     ListView listView = ListView.builder(itemCount: ApiBloc.of(context)!.getRecipes()[holder].steps.length,
//       itemBuilder: (BuildContext context, int index) {
//       return  Text(data[holder].steps[index]);
//               });
//     return Scaffold(  appBar: AppBar(
//     title: const Text("Detail Screen"),
//       ),
//       body:Stack(
//         children: [
//            ListView(
//             children: [
//                Image.network(data[holder].imageUrl),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Text(
//                     data[holder].name,
//                     style: const TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//               Text(data[holder].desc),
//               Text(data[holder].id),
//               Text(data[holder].note),
//               // listView,



//               // ListView.builder(itemCount: ApiBloc.of(context)!.getRecipes().length,
//               // itemBuilder: (BuildContext context, int index) {
//               // return  Text(data[holder].ingredients[index].name + "Quantity = " + data[holder].ingredients[index].amount + " " + data[holder].ingredients[index].unit);
//               // }),
//               // Text(data[holder].ingredients[1].name)
//               // Text(snapshot.data![holder].desc),Text(snapshot.data![holder].ingredients[0].name)
//             ],
//           )
//           // ;})
//           ,
//           Align(
//               alignment: Alignment.topLeft,
//               child: GestureDetector(
//                 child:
//                     const Icon(Icons.arrow_back, color: Colors.black, size: 25),
//                 onTap: (){Navigator.pushNamed(context, ItemListPage.routeName);}
//               )),
//         ],
//       )
//       );
//   }
// }