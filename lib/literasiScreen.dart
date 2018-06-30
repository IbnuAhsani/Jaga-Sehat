import './homeScreen.dart';
import './reusableWidgets.dart';
import 'package:flutter/material.dart';

class LiterasiScreen extends StatefulWidget {
  @override
  _LiterasiScreen createState() => _LiterasiScreen();
}

class _LiterasiScreen extends State<LiterasiScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: choices.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var backButton = IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Color(0xFFC54C82),
      ),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );

    var bottom = PreferredSize(
      preferredSize: const Size.fromHeight(38.0),
      child: Theme(
        data: Theme.of(context).copyWith(accentColor: Color(0xFFC54C82)),
        child: Container(
          height: 38.0,
          alignment: Alignment.center,
          child: TabPageSelector(controller: _tabController),
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
      ),
      home: Scaffold(
        appBar: CustomAppBar4(
          button: backButton,
          bottoms: bottom,
        ),
        body: Container(
          color: Color(0xFFC54C82),
          child: TabBarView(
              controller: _tabController,
              children: choices.map((Choice choice) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceCard(choice: choice),
                );
              }).toList()),
        ),
      ),
    );
  }
}

class Choice {
  final String link;
  const Choice({this.link});
}

const List<Choice> choices = const <Choice>[
  const Choice(link: 'assets/literasi/title.jpg'),
  const Choice(link: 'assets/literasi/index.jpg'),
  const Choice(link: 'assets/literasi/greetings.jpg'),
  const Choice(link: 'assets/literasi/one.jpg'),
  const Choice(link: 'assets/literasi/two.jpg'),
  const Choice(link: 'assets/literasi/three.jpg'),
  const Choice(link: 'assets/literasi/four.jpg'),
  const Choice(link: 'assets/literasi/five.jpg'),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Color(0xFFC54C82),
      child: Center(
        child: Image(
          image: AssetImage(choice.link),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
