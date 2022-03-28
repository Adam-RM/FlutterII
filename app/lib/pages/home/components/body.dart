import 'package:app/bloc/api_bloc.dart';
import 'package:app/bloc/api_event.dart';
import 'package:app/pages/Itemlist/itemlist.dart';
import 'package:flutter/material.dart';
import '../../itemdetails/itemdetails.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiBloc apiBloc = new ApiBloc();

    apiBloc.apiEventSink.add(FetchEvent());

    return SafeArea(
        child: Center(
      child: TextButton(
        child: Text('redirect to Item List screen'),
        onPressed: () {
          Navigator.pushNamed(context, ItemListPage.routeName);
        },
      ),
    ));
  }
}
