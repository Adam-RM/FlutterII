import 'dart:async';
import 'package:app/bloc/api_event.dart';
import 'package:app/Models/RecipeModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiBloc {
  String url = "http://localhost:3000/recipes";
  bool fetch = false;

  List<RecipeModel> _recipes = new List.empty();

  final _apiStateController = StreamController<List<RecipeModel>>();
  StreamSink<List<RecipeModel>> get _inApi => _apiStateController.sink;
  // For state, exposing only a stream which outputs data
  Stream<List<RecipeModel>> get items => _apiStateController.stream;

  final _apiEventController = StreamController<ApiEvent>();
  // For events, exposing only a sink which is an input
  Sink<ApiEvent> get apiEventSink => _apiEventController.sink;

  ApiBloc() {
    // Whenever there is a new event, we want to map it to a new state
    _apiEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ApiEvent event) {
    if (event is FetchEvent) {
      fetchApi();
    } else if (event is AddEvent) {
      _recipes.add(event.newItem);
    }
    _inApi.add(_recipes);
  }

  void fetchApi() async {
    var _initialResponse = await http.get(url);
    var jsonText;
    int responseCode = _initialResponse.statusCode;
    if (responseCode == 200) {
      jsonText = convert.jsonDecode(_initialResponse.body);

      //json convertion
    } else {
      print('Request failed with status:');
    }
  }

  void dispose() {
    _apiStateController.close();
    _apiEventController.close();
  }
}
