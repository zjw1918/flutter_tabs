import 'package:flutter/material.dart';
import 'package:hellp/_main.dart';

import 'pages/home/home.dart';
import 'pages/setting/setting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Home(),
      initialRoute: '/',
      routes: {
        '/': (context) => MainTab(),
        '/articles': (context) => ArticleListScreen(),
      },
    );
  }
}

class MainTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainTabState();
  }
}

class _MainTabState extends State<MainTab> {
  int _currIndex = 0;
  final pageCtrl = PageController();

  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Setting')),
  ];

  final _children = [
    HomePage('Home'),
    SettingPage('Setting'),
  ];

  onTap(int index) {
    pageCtrl.jumpToPage(index);
  }

  onPageChanged(int index) {
    setState(() {
      this._currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageCtrl,
        onPageChanged: onPageChanged,
        children: _children,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: _currIndex,
        items: items,
      ),
    );
  }
}
