import 'package:flutter/material.dart';

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
      home: ArticleListScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('nav to 2 page'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
          },
        ),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Screen'),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text('Go back!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class Article {
  String title;
  String content;

  Article({this.title, this.content});
}

class ArticleListScreen extends StatelessWidget {
  final articles = List<Article>.generate(
    20,
    (i) => Article(title: 'title $i', content: 'content ... $i'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article list'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(articles[i].title),
          onTap: () async {
            // Navigate to the second screen using a named route
            // Navigator.pushNamed(context, '/second');

            String res = await Navigator.push(
              context,
              // MaterialPageRoute(
              //   builder: (context) => ContentScreen(articles[i])
              // )
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 1),
                pageBuilder: (___, _, __) => ContentScreen(articles[i]),
                transitionsBuilder: (_, Animation<double> animation, __, Widget child) => 
                  FadeTransition(
                    opacity: animation,
                    child: RotationTransition(
                      turns: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                      child: child,
                    ),
                  )
              )
            );

            if (res != null) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(res),
                duration: Duration(seconds: 1),
              ));
            }
          },
        ),
      ),
    );
  }
}

class ContentScreen extends StatelessWidget {
  final Article article;

  ContentScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(article.content),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  child: Text('Like'),
                  onPressed: () {
                    Navigator.pop(context, 'Like');
                  },
                ),
                RaisedButton(
                  child: Text('UnLike'),
                  onPressed: () {
                    Navigator.pop(context, 'UnLike');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}