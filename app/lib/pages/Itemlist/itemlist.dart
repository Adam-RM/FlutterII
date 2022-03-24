import 'package:flutter/material.dart';

class ItemListPage extends StatefulWidget {
  const ItemListPage({Key? key}) : super(key: key);
  static String routeName = '/list';

  @override
  _ItemListPage createState() => _ItemListPage();
}

class _ItemListPage extends State<ItemListPage> {
  final List<ListItem> items = List.from(listItem);
  final listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item List"),
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) => ListItemWidget(
            item: items[index],
            animation: animation,
            onClicked: () => removeItem(index)),
      ),
    );
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
  final ListItem item;
  final Animation<double> animation;
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
          backgroundImage: NetworkImage(item.urlImage),
          radius: 32,
        ),
        title: Text(
          item.title,
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

class ListItem {
  final String title;
  final String urlImage;
  final String subTitle;

  const ListItem(
      {required this.title, required this.urlImage, required this.subTitle});
}

final List<ListItem> listItem = [
  const ListItem(
      title: 'Milk',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Djahid',
      urlImage:
          'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Milk',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Djahid',
      urlImage:
          'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Milk',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Djahid',
      urlImage:
          'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Milk',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Djahid',
      urlImage:
          'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Milk',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Djahid',
      urlImage:
          'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Milk',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Djahid',
      urlImage:
          'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Milk',
      urlImage:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Milk_001.JPG/576px-Milk_001.JPG',
      subTitle: 'Dessert'),
  const ListItem(
      title: 'Djahid',
      urlImage:
          'https://m.media-amazon.com/images/I/71o063oFT5L._AC_SX450_.jpg',
      subTitle: 'Dessert'),
];
