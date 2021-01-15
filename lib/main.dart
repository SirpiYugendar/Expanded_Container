import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: new ThemeData(
            primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
        home: ContainerClass(title: 'Sirpi'));
  }
}

class ContainerClass extends StatefulWidget {
  final String title;
  ContainerClass({Key key, this.title}) : super(key: key);

  @override
  _ContainerClassState createState() => _ContainerClassState();
}

class _ContainerClassState extends State<ContainerClass> {
  bool _isTopExpanded = false;
  bool _isBottomExpanded = false;
  void toggleTop() {
    setState(() {
      _isTopExpanded = !_isTopExpanded;
    });
  }

  void toggleBottom() {
    setState(() {
      _isBottomExpanded = !_isBottomExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    Container topContainer = Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.yellowAccent,
      ),
      padding: EdgeInsets.all(5),
      child: Text(
        'Top',
        style:
            Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),
      ),
    );
    Container bottomContainer = Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        color: Colors.blueAccent,
      ),
      padding: EdgeInsets.all(5),
      child: Text(
        'Bottom',
        style:
            Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),
      ),
    );
    Widget topWidget =
        _isTopExpanded ? Expanded(child: topContainer) : topContainer;
    Widget bottomWidget =
        _isBottomExpanded ? Expanded(child: bottomContainer) : bottomContainer;

    return Scaffold(
      appBar: AppBar(
        title: Text('SirpiYugendar'),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () => toggleTop(),
            label: Text('Top'),
            icon: Icon(_isTopExpanded ? Icons.expand_more : Icons.expand_less),
          ),
          FlatButton.icon(
              onPressed: () => toggleBottom(),
              icon: Icon(
                  _isBottomExpanded ? Icons.expand_more : Icons.expand_less),
              label: Text('Bottom'))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            topWidget,
            bottomWidget
          ],
        ),
      ),
    );
  }
}
