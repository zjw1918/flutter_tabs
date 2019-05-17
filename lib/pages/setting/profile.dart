import 'package:flutter/material.dart';

class Profile extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }

}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin<Profile> {

  @override
  void initState() {
    super.initState();
    print('init profile');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('profile'),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

}