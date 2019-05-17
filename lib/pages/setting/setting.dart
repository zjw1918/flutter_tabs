import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class SettingPage extends StatelessWidget {
  final String _title;

  SettingPage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: <Widget>[
          Text(_title),
          Expanded(
            child: Profile(),
          ),
        ],
      ),
    );
  }
}
