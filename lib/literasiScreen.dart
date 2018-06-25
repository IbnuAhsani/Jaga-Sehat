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

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: Text(
            'jaga sehat',
            style: TextStyle(
              color: Color(0xFFC54C82),
              fontSize: 26.0,
              fontFamily: 'Kelvetica',
            ),
          ),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFFC54C82),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          actions: <Widget>[
            Container(
              width: 40.0,
              height: 40.0,
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/logo/logo3.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(38.0),
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Color(0xFFC54C82)),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: TabPageSelector(controller: _tabController),
              ),
            ),
          ),
        ),
        body: Container(
          color: Color(0xFFC54C82),
          child: TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChoiceCard(choice: choice),
            );
          }).toList()
        ),
      ),
        ) 
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
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              image: AssetImage(choice.link),
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
