import 'package:flutter/material.dart';
import 'package:training_flutter_krungsri/src/global_variable.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbarTitle'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
          top: 10.0,
          bottom: 40.0,
        ),
        itemBuilder: (context, index) {
          final item = GlobalVariable.favoriteItem[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.avatarImage),
            ),
            title: Text(
              item.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              item.subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                GlobalVariable.favoriteItem.removeWhere((youtube) {
                  return youtube.id == item.id;
                });
                setState(() {});
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
              //height: 5.0,
              );
        },
        itemCount: GlobalVariable.favoriteItem.length,
      ),
    );
  }
}
