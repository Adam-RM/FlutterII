import 'package:flutter/material.dart';
import 'package:app/pages/detailScreen/detaiScreen.dart';

import '../../Models/RecipeModel.dart';
import '../../bloc/api_bloc.dart';
import '../../bloc/api_event.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);
  static String routeName = '/list';

  @override
  _ItemListPage createState() => _ItemListPage();
}

class _ItemListPage extends State<ItemListPage> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  _loadAlbums() async {
    // print("load album 1");
    // // ApiBloc.of(context)?.apiEventSink.add(FetchEvent());
    // print("load album 2");
    // print(ApiBloc.of(context)?.i);

    // context.bloc<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Item List"),
        ),
        body: AnimatedList(
          initialItemCount: ApiBloc.of(context)!.getRecipes().length,
          itemBuilder: (context, index, animation) => ListItemWidget(
              item: ApiBloc.of(context)!.getRecipes()[index],
              animation: animation,
              delete: () {
                // todo remove item
              },
              onClicked: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // builder: (context) => DetailScreen(holder: index)));
                        builder: (context) => DetailRecipes(
                              recipe: ApiBloc.of(context)!.getRecipes()[index],
                            )));
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (() {
            openDialog();
          }),
        ));
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('New recipe'),
            content: Column(
              children: const [
                TextField(
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Image Url'),
                ),
                TextField(
                  decoration: InputDecoration(hintText: 'Description'),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    submit();
                  },
                  child: Text('Create')),
            ],
          ));

  void submit() {
    // TODO CREQTE RECIPE
    Navigator.of(context).pop();
  }

  void removeItem(int index) {
    // TODO REMOVE RECIPE
    // final removedItem = items[index];
    // items.removeAt(index);
    // listKey.currentState!.removeItem(
    //     index,
    //     (context, animation) => ListItemWidget(
    //         item: removedItem, animation: animation, onClicked: () {}));
  }
}

class ListItemWidget extends StatelessWidget {
  final RecipeModel item;
  final Animation<double> animation;
  final VoidCallback? onClicked;
  final VoidCallback? delete;

  const ListItemWidget(
      {required this.item,
      required this.animation,
      required this.onClicked,
      required this.delete,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
        sizeFactor: animation,
        child: buildItem(),
      );

  Widget buildItem() => Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey[100]),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.imageUrl),
          radius: 32,
        ),
        title: Text(
          item.name,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: delete,
        ),
        subtitle: Text(item.desc),
        onTap: onClicked,
      ));
}
