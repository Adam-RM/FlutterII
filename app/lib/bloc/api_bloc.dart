import 'dart:async';
import 'dart:io';
import 'package:app/bloc/api_event.dart';
import 'package:app/Models/RecipeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../Constants/RecipeKey.dart';

class ApiBloc extends InheritedWidget {
  final String url = "http://192.168.0.18:3000/recipes";
  var fetch = false;

  List<RecipeModel> _recipes = List.empty();
  int _connectivity = 0;

  // final _apiStateController = StreamController<List<RecipeModel>>();
  // StreamSink<List<RecipeModel>> get _inItems => _apiStateController.sink;
  // // For state, exposing only a stream which outputs data
  // Stream<List<RecipeModel>> get items => _apiStateController.stream;

  final _apiEventController = StreamController<ApiEvent>();
  // For events, exposing only a sink which is an input
  Sink<ApiEvent> get apiEventSink => _apiEventController.sink;

  ApiBloc({Key? key, required Widget child}) : super(key: key, child: child) {
    print("contructor");
    // Whenever there is a new event, we want to map it to a new state
    _apiEventController.stream.listen(_mapEventToState);
    _apiEventController.sink.add(FetchEvent());
  }

  List<RecipeModel> getRecipes() {
    return (_recipes);
  }

  int getConnectivity() {
    print (_connectivity);
    return (_connectivity);
  }

  void _mapEventToState(ApiEvent event) {
    //print("fetching 1");
    // if (event is FetchEvent) {
    //  fetchApi();
    // } else if (event is AddEvent && fetch == true) {
    //   _recipes.add(event.newItem);
    // }

    if (event is FetchEvent) {
      try {
        fetchApi();
      } on SocketException  catch (_) {
        // TODO SHOW NO INTERNET PAGE
        print('no internet');
      } on FormatException catch (_) {
        // TODO SHOW INVALID RESPONSE FORMAT
        print('Invalid Response format');
      } on HttpException catch (_) {
        // TODO SHOW NO SERVICE FOUND
        print('No Service Found');
      }
    } else if (event is AddEvent && fetch == true) {
      _recipes.add(event.newItem);
    }
  }

  Future<Type> fetchApi() async {
    print("fetching 2");
    var _initialResponse = await http.get(url);
    print("reponse");
    int responseCode = _initialResponse.statusCode;

    var ping = await InternetAddress.lookup("www.google.com");
    if (ping.isNotEmpty)
      _connectivity = 200;

    print ("code:");
    print (_connectivity);
    if (responseCode == 200) {
      print('Request done');
      var jsonText = convert.jsonDecode(_initialResponse.body);
      if (!_recipes.isEmpty)
        _recipes.clear();
      var recipesJson = jsonText as List;
      print("recipes in list");

      RecipeModel.fromJson(recipesJson[0]);
      _recipes = (recipesJson.map((i) => RecipeModel.fromJson(i)).toList());
      // (jsonText[recipes_key] as List).forEach((element) {
      //   print("New recipe to add");
      //   _recipes.add(RecipeModel.fromJson(element));
      //   print("New recipe added");
      // });
      // print("the recipe is fetch and parsed");
      // _inItems.add(_recipes);
      fetch = true;



      return Future;
    } else {

      print('Request failed');
      _connectivity = responseCode;
      return SocketException;
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
