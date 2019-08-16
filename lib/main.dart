import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dashboard',
      home: Scaffold(
        body: MenuDashPage(),
      ),
    );
  }
}

class MenuDashPage extends StatefulWidget {
  @override
  _MenuDashPageState createState() => _MenuDashPageState();
}

class _MenuDashPageState extends State<MenuDashPage>
    with SingleTickerProviderStateMixin {
  bool isCollpased = true;
  final Duration duration = Duration(milliseconds: 300);
  double screenHeight, screenWidth;
  AnimationController _ctrl;
  Animation<double> _animation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: duration);
    _animation = Tween<double>(begin: 1, end: 0.6).animate(_ctrl);
    _menuScaleAnimation = Tween<double>(begin: 0, end: 1).animate(_ctrl);
    _slideAnimation =
        Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Stack(
      children: <Widget>[
        menu(context),
        dashboard(context),
      ],
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'dashboard',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  'messages',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  'bills',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  'project-1',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 10),
                Text(
                  'project-2',
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollpased ? 0 : 0.6 * screenWidth,
      right: isCollpased ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _animation,
        child: Material(
            animationDuration: duration,
            borderRadius:
                BorderRadius.all(Radius.circular(isCollpased ? 0 : 40)),
            elevation: 8,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 8, top: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        InkWell(
                            child: Icon(Icons.menu),
                            onTap: () {
                              setState(() {
                                if (isCollpased)
                                  _ctrl.forward();
                                else
                                  _ctrl.reverse();

                                isCollpased = !isCollpased;
                              });
                            }),
                        Text('Dashboard'),
                        Icon(Icons.more_vert),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 600,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.redAccent,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.blueAccent,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.purpleAccent,
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
