import 'package:flutter/material.dart';

class HorizontalButtonBar extends StatelessWidget {
  HorizontalButtonBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'contacts',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/addContactPage');
            },
            child: Icon(Icons.person_add),
          ),
          FloatingActionButton(
            heroTag: 'search',
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/searchPage');
            },
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
