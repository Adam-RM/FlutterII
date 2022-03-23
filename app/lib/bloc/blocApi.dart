import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class ApiBloc {
  String url = "http://localhost:3000/recipes";
  var _initialResponse;
  var jsonText;
  ApiBloc() {
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\n");
    fetchApi();
    //if (jsonText != Null)
     // var name = jsonText['name'];
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\n");
    
  }

  String getApi(){
    print(jsonText[0]['name']);
    return jsonText;
  }
  void fetchApi() async {
    _initialResponse = await http.get(url);
    int responseCode = _initialResponse.statusCode;
    if (responseCode == 200) {
      print ("succsess");
       jsonText = convert.jsonDecode(_initialResponse.body);

      print (jsonText);
    } else {
      print('Request failed with status:');
    }
  }
}