import 'dart:async';
import 'package:app/bloc/api_event.dart';
import 'package:app/Models/RecipeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../Constants/RecipeKey.dart';

class ApiBloc extends InheritedWidget {
  final String url = "http://localhost:3000/recipes";
  var fetch = false;

  List<RecipeModel> _recipes = List.empty();
  int i;

  // final _apiStateController = StreamController<List<RecipeModel>>();
  // StreamSink<List<RecipeModel>> get _inItems => _apiStateController.sink;
  // // For state, exposing only a stream which outputs data
  // Stream<List<RecipeModel>> get items => _apiStateController.stream;

  final _apiEventController = StreamController<ApiEvent>();
  // For events, exposing only a sink which is an input
  Sink<ApiEvent> get apiEventSink => _apiEventController.sink;

  ApiBloc(this.i, {Key? key, required Widget child})
      : super(key: key, child: child) {
    print("contructor");
    // Whenever there is a new event, we want to map it to a new state
    _apiEventController.stream.listen(_mapEventToState);
    _apiEventController.sink.add(FetchEvent());
  }

  List<RecipeModel> getRecipes() {
    return (_recipes);
  }

  void _mapEventToState(ApiEvent event) {
    print("fetching");
    if (event is FetchEvent) {
      fetchApi();
    } else if (event is AddEvent && fetch == true) {
      _recipes.add(event.newItem);
    }
  }

  void fetchApi() async {
    // print("fetching");
    var _initialResponse = await http.get(url);
    // print("reponse");
    int responseCode = _initialResponse.statusCode;
    if (responseCode == 200) {
      var jsonText = convert.jsonDecode(_initialResponse.body);
      // print("json decoded");
      // _recipes.clear();
      var recipesJson = jsonText as List;
      // print("recipes in list");

      // RecipeModel.fromJson(recipesJson[0]);
      _recipes = (recipesJson.map((i) => RecipeModel.fromJson(i)).toList());
      // (jsonText[recipes_key] as List).forEach((element) {
      //   print("New recipe to add");
      //   _recipes.add(RecipeModel.fromJson(element));
      //   print("New recipe added");
      // });
      // print("the recipe is fetch and parsed");
      // _inItems.add(_recipes);
      fetch = true;
    } else {
      print('Request failed');
    }
  }

  void dispose() {
    // _apiStateController.close();
    _apiEventController.close();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ApiBloc? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ApiBloc>();
}
