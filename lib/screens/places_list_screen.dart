import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';
import '../providers/greate_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: const Center(
          child: Text('Got no places yet, start adding some!'),
        ),
        builder: (ctx, greatePlaces, ch) => greatePlaces.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: greatePlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatePlaces.items[i].image),
                  ),
                  title: Text(greatePlaces.items[i].title),
                  onTap: () {
                    // go to detail page...
                  },
                ),
              ),
      ),
    );
  }
}
