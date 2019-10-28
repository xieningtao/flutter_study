import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:futter_study/MsgEvent.dart';
import 'package:futter_study/main.dart';
import 'package:futter_study/wordList.dart';

import 'PageOne.dart';
import 'common/CommonGlobal.dart';

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
    logger.i("changeTab");
    loggerNoStack.i("############change###########");
    this.setState(() {
      barIndex = index;
    });
  }

  List<Widget> pages = [ MyHomePage(title: "pageOne"),
    WordRandom(),
    Text("5555")];

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> barItems = new List();
    barItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.access_alarm), title: Text("QQ")));
    barItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.accessibility), title: Text("7777")));
    barItems.add(new BottomNavigationBarItem(
        icon: new Icon(Icons.home), title: Text("4")));

    List<Widget> actions = new List();
    actions.add(new IconButton(icon: new Icon(Icons.list),onPressed: ()=>{
      CommonGlobal.evenBus.fire(new ActionEvent(action:"wordRandom"))
    }));

    // TODO: implement build
    return new DefaultTabController(
        length: barItems.length,
        initialIndex: barIndex,
        child: Scaffold(
          appBar: new AppBar(title: Text("Test"),
            actions: barIndex == 1 ? actions:null,),
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