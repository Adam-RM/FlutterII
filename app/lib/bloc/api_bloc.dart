import 'dart:async';
import 'dart:io';
import 'package:app/bloc/api_event.dart';
import 'package:app/Models/RecipeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../Constants/RecipeKey.dart';

class ApiBloc extends InheritedWidget {
  final String url = "http://localhost:3000/recipes";
  var fetch = false;

  List<RecipeModel> recipes = List.empty();
  int _connectivity = 0;

  final _apiEventController = StreamController<ApiEvent>();
  // For events, exposing only a sink which is an input
  Sink<ApiEvent> get apiEventSink => _apiEventController.sink;

  ApiBloc({Key? key, required Widget child}) : super(key: key, child: child) {
    print("contructor");
    // Whenever there is a new event, we want to map it to a new state
    _apiEventController.stream.listen(_mapEventToState);
    _apiEventController.sink.add(FetchEvent());
  }

  // List<RecipeModel> getRecipes() {
  //   return (recipes);
  // }

  int getConnectivity() {
    print(_connectivity);
    return (_connectivity);
  }

  void _mapEventToState(ApiEvent event) {
    if (event is FetchEvent) {
      try {
        fetchApi();
      } on SocketException catch (_) {
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
      recipes.add(event.newItem);
    } else if (event is RemoveEvent && fetch == true) {
      recipes.removeAt(event.index);
    }
  }

  Future<Type> fetchApi() async {
    print("ping google");
    // var ping = await InternetAddress.lookup("www.google.com");
    // if (ping.isNotEmpty) _connectivity = 1;
    print("code:");
    print(_connectivity);

    print("fetch data");
    var _initialResponse = await http.get(url);
    int responseCode = _initialResponse.statusCode;
    _connectivity = responseCode;
    print(responseCode);
    if (responseCode == 200) {
      var jsonText = convert.jsonDecode(_initialResponse.body);
      if (!recipes.isEmpty) recipes.clear();
      var recipesJson = jsonText as List;
      print("recipes in list");

      RecipeModel.fromJson(recipesJson[0]);
      recipes = (recipesJson.map((i) => RecipeModel.fromJson(i)).toList());
      fetch = true;

      return Future;
    } else {
      print('Request failed');
      _connectivity = responseCode;
      return SocketException;
    }
  }

  void dispose() {
    _apiEventController.close();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ApiBloc? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ApiBloc>();
}
