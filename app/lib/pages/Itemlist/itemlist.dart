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
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();

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
          initialItemCount: ApiBloc.of(context)!.recipes.length,
          itemBuilder: (context, index, animation) => ListItemWidget(
              item: ApiBloc.of(context)!.recipes[index],
              animation: animation,
              delete: () {
                removeItem(index);
              },
              onClicked: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        // builder: (context) => DetailScreen(holder: index)));
                        builder: (context) => DetailRecipes(
                              recipe: ApiBloc.of(context)!.recipes[index],
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
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: imageController,
                  decoration: InputDecoration(hintText: 'Image Url'),
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(hintText: 'Description'),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    submit(nameController.text, descController.text,
                        imageController.text);
                  },
                  child: Text('Create')),
            ],
          ));

  void submit(name, desc, imageUrl) {
    ApiBloc.of(context)!
        .apiEventSink
        .add(AddEvent(RecipeModel(name: name, desc: desc, imageUrl: imageUrl)));
    Navigator.of(context).pop();
  }

  void removeItem(int index) {
    ApiBloc.of(context)!.apiEventSink.add(RemoveEvent(index));
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
