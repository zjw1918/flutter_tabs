
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'address_list.dart';

class HomePage extends StatelessWidget {
  final String title;

  HomePage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Text(title),
          RaisedButton(
            child: Text('go articles'),
            onPressed: () {
              Navigator.of(context).pushNamed('/articles');
            },
          ),
          OutlineButton(
            child: Text('pressed'),
            onPressed: () async {
              print('onPressed...');
            },
          ),
          Expanded(
            child: AddressList(),
          ),
        ],
      ),
    );
  }
}