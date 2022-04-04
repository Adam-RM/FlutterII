import 'package:app/Models/RecipeModel.dart';

abstract class ApiEvent {}

class FetchEvent extends ApiEvent {}

class AddEvent extends ApiEvent {
  RecipeModel newItem;

  AddEvent(this.newItem);
}

class RemoveEvent extends ApiEvent {
  int index;

  RemoveEvent(this.index);
}
