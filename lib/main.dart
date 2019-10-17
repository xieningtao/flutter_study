import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'wordList.dart';

import 'package:common_utils/common_utils.dart';
import 'package:logger/logger.dart';

void main() => runApp(MyApp());

var logger = Logger(
  printer: PrettyPrinter(),
);

class MyApp extends StatelessWidget {
  MyApp(){
    LogUtil.init(isDebug: true);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter study',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
      ),
//      home: MyHomePage(title: 'home'),
//      home: TabbedAppBarSample(),
      home: BottomHomePage(),
    );
  }
}

class BottomHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BottomHomeState();
  }
}

class BottomHomeState extends State<BottomHomePage> {
  int barIndex = 0;
  int pageIndex = 0;


  void changeTab(int index) {
    this.setState(() {
      barIndex = index;
    });
  }

  List<Widget> pages = [ Text("111111111"),
    Text("22222222222"),
    Text("333333333333333")];

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> barItems = new List();
    barItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.access_alarm), title: Text("111")));
    barItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.accessibility), title: Text("222")));
    barItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.home), title: Text("333")));

    // TODO: implement build
    return new DefaultTabController(
        length: barItems.length,
        initialIndex: barIndex,
        child: Scaffold(
          appBar: new AppBar(title: Text("Test")),
          bottomNavigationBar: BottomNavigationBar(
            items: barItems,
            type: BottomNavigationBarType.fixed,
            onTap: changeTab,
            currentIndex: barIndex,
          ),
          body: Center(child: pages[barIndex],),
        ));
  }
}


class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: AppBar(title: new Text("Home"),),
          bottomNavigationBar: new BottomAppBar(
            color: Colors.blue,
            child: new TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                  icon: new Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: new TabBarView(
            children: choices.map((Choice choice) {
              return  new ChoiceCard(choice: choice);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String TAG = "###Home###";
  int _counter = 0;
  String _tips = "";

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child:Text(widget.title,)),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(color: Colors.red,fontSize: 14),
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            RaisedButton(onPressed:_toWordList,textColor: Colors.blue,child: Text(
              'to next',
            )),
            Container(
                padding: EdgeInsets.all(10),
                color: Colors.lightBlue,
                margin: EdgeInsetsDirectional.only(start: 20,top: 20),
                child:OutlineButton(onPressed: loadData,child: Text("change tips"))),
            Text(
              '$_tips',
              style: TextStyle(color: Colors.yellow),
            ),
            RaisedButton(
                onPressed: _toWordList,
                textColor: Colors.blue,
                child: Text(
                  'to next',
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.red,
        child: Text("C",style: TextStyle(color: Colors.white),),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _toWordList() {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return WordRandom();
            }));

  void _changeTips(){
    setState(() {
      this._tips=_tips + "change me";
    });
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    var result = json.decode(response.body);
//    LogUtil.v(result.toString(),tag:TAG);
//  print("result: "+result.toString());
  logger.v(result.toString());
  }

  void _toWordList(){
    Navigator.push(context, PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) {
      return WordRandom();
    }));
  }

  void _toNext() {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: WordRandom());
    }));
  }
}
