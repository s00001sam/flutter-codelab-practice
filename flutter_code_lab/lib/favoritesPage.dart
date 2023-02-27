import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;
    final wordTxt = favorites.length > 1 ? 'words' : 'word';

    if (favorites.isEmpty) {
      return Center(
        child: Text("You don't have any favorite words."),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('You have ${favorites.length} favorite $wordTxt :'),
        ),
        Expanded(
            child: GridView.extent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 400 / 80,
          children: [
            for (var favorite in favorites)
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    appState.removeFavorite(favorite);
                  },
                ),
                title: Row(
                  children: [
                    Text(favorite.asLowerCase),
                  ],
                ),
              )
          ],
        ))
      ],
    );
  }
}
