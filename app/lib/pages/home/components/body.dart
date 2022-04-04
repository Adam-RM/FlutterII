import 'package:app/bloc/api_bloc.dart';
import 'package:app/bloc/api_event.dart';
import 'package:app/pages/Itemlist/itemlist.dart';
import 'package:app/pages/detailScreen/detaiScreen.dart';
import 'package:flutter/material.dart';
import '../../itemdetails/itemdetails.dart';
import '../../noconnection/badapi.dart';
import '../../noconnection/noapi.dart';
import '../../noconnection/noconnection.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //ApiBloc apiBloc = new ApiBloc();

    return SafeArea(
        child: Center (
            child: Column(
              children: [
                  MyButton(
                      press: () => redirectConnectivity(context)
                  ),
              ],
            )
    )
    );
  }
}

Future<Object?> redirectConnectivity (context) {
  print(ApiBloc.of(context)!.getConnectivity());
  if (ApiBloc.of(context)!.getConnectivity() == 200) {
    return (Navigator.pushNamed(context, ItemListPage.routeName));
  }
  if (ApiBloc.of(context)!.getConnectivity() == 1) {
    return (Navigator.pushNamed(context, NoApiPage.routeName));
  }
  if (ApiBloc.of(context)!.getConnectivity() == 0) {
    return (Navigator.pushNamed(context, NoConnectionPage.routeName));
  }

  print(ApiBloc.of(context)!.getConnectivity());
  return (Navigator.pushNamed(context, ApiAvailablePage.routeName));
}


class MyButton extends StatelessWidget {
  const MyButton({
    Key? key, required this.press,
  }) : super(key: key);

  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: press,
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Access to Recipes'),
        ),
      ),
    );
  }
}