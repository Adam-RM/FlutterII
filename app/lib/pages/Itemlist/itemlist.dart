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
              onClicked: () {Navigator.push(
          context,MaterialPageRoute(
            builder: (context) =>  DetailScreen(holder: index)));}),
        ));
  }

  void removeItem(int index) {
    final removedItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(
        index,
        (context, animation) => ListItemWidget(
            item: removedItem, animation: animation, onClicked: () {}));
  }
}

class ListItemWidget extends StatelessWidget {
  final RecipeModel item;
  final Animation animation;
  final VoidCallback? onClicked;

  const ListItemWidget(
      {required this.item,
      required this.animation,
      required this.onClicked,
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
          onPressed: onClicked,
        ),
        subtitle: Text(item.subTitle),
      ));
}

// class ListItem {
//   final String title;
//   final String urlImage;
//   final String subTitle;

//   const ListItem(
//       {required this.title, required this.urlImage, required this.subTitle});
// }

// final List<ListItem> listItem = [
//   const ListItem(
//       title: 'Milk',
//       urlImage:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Djahid',
//       urlImage:
//           'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Milk',
//       urlImage:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Djahid',
//       urlImage:
//           'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Milk',
//       urlImage:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Djahid',
//       urlImage:
//           'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Milk',
//       urlImage:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Djahid',
//       urlImage:
//           'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Milk',
//       urlImage:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Djahid',
//       urlImage:
//           'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Milk',
//       urlImage:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Djahid',
//       urlImage:
//           'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Milk',
//       urlImage:
//           'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
//       subTitle: 'Dessert'),
//   const ListItem(
//       title: 'Djahid',
//       urlImage:
//           'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
//       subTitle: 'Dessert'),
// ];
