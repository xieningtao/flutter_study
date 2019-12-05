import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:futter_study/bean/person_info.dart';
import 'package:futter_study/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'bean/my_person_info.dart';

class RecommendPage extends StatefulWidget {
  RecommendPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  final String TAG = "###Home###";
  int _counter = 0;
  String _tips = "";
  MyPersonInfo _personInfo;
  bool _isLoading = false;

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
  void initState() {
    // TODO: implement initState
    super.initState();
    this._loadPersonList();
  }

  Widget buildPersonList() {
    return Stack(children: <Widget>[
      Container(
          child: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return buildRow(_personInfo.para.suspenser[index]);
        },
        itemCount: _personInfo != null &&
                _personInfo.para != null &&
                _personInfo.para.suspenser != null
            ? _personInfo.para.suspenser.length
            : 0,
      )),
      _isLoading ? Center(child: CircularProgressIndicator()) : Container(height:0.0,width:0.0)
    ]);
  }

  Widget buildRow(Suspenser suspenser) {
    return new Card(
        child: new Container(
            margin: EdgeInsets.all(5),
            child: GestureDetector(
              child: new Column(
                children: <Widget>[
                  Image(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575462717237&di=0a2fb0a883eb1b20bc93762a509fb59c&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201809%2F26%2F20180926162125_vjbwi.jpg"),
                      ),
                      Text(suspenser.name,
                          style: TextStyle(color: Colors.red, fontSize: 18)),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(suspenser.place),
                      )
                    ],
                  )
                ],
              ),
              onTap: this._tapItem(suspenser),
            )));
  }

  _tapItem(Suspenser suspenser) {}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

        body: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: buildPersonList()));
  }

  //网络请求数据
  _loadPersonInfo() async {
    String dataURL =
        "https://raw.githubusercontent.com/xieningtao/documents/master/person_info.txt";
    http.Response response = await http.get(dataURL);
    Map userMap = json.decode(response.body);
    var user = new PersonInfo.fromJson(userMap);
    logger.i(user);
  }

  //网络请求数据
  _loadPersonList() async {
    setState(() {
      _isLoading = true;
    });
    String dataURL =
        "https://raw.githubusercontent.com/xieningtao/documents/master/person_list.txt";
    http.Response response = await http.get(dataURL);
    Map userMap = json.decode(response.body);
    var user = new MyPersonInfo.fromJson(userMap);
    setState(() {
      this._personInfo = user;
      _isLoading = false;
    });
    logger.i(user);
  }
}
