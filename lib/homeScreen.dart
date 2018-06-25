import 'package:flutter/material.dart';
import './kontakScreen.dart';
import './kontakScreen2.dart';
import './literasiScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.button;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          title: Text(
            'Jaga Sehat',
            style: TextStyle(
                color: Color(0xFFC54C82),
                fontSize: 26.0,
                fontFamily: 'Kelvetica'),
          ),
          actions: <Widget>[
            GestureDetector(
              child: Container(
                width: 40.0,
                height: 40.0,
                margin: EdgeInsets.all(8.0),
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
              onTap: () => _devsDialog(context),
            ),
          ],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: RaisedButton(
                    elevation: 2.5,
                    padding: EdgeInsets.all(40.0),
                    color: Color(0xFFC54C82),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.import_contacts,
                          size: 60.0,
                          color: Colors.white,
                        ),
                        Text(
                          'Literasi',
                          style: TextStyle(color: Colors.white, fontSize: 36.0),
                        ),
                      ],
                    ),
                    onPressed: () {
                      var routes = MaterialPageRoute(
                          builder: (BuildContext context) => LiterasiScreen());
                      Navigator.of(context).push(routes);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: RaisedButton(
                    elevation: 2.5,
                    padding: EdgeInsets.all(40.0),
                    color: Color(0xFF512E67),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.contact_phone,
                          size: 60.0,
                          color: Colors.white,
                        ),
                        Text(
                          'Kontak',
                          style: TextStyle(color: Colors.white, fontSize: 36.0),
                        ),
                      ],
                    ),
                    onPressed: () {
                      var routes = MaterialPageRoute(
                          builder: (BuildContext context) => KontakScreen2());
                      Navigator.of(context).push(routes);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_devsDialog(BuildContext context) {
  showDialog(
    context: context,
    child: Center(
      child: Container(
        width: 320.0,
        height: 280.0,
        child: Card(
          elevation: 0.5,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Pengembang Aplikasi',
                  style: TextStyle(
                    color: Color(0xFFC54C82),
                    fontSize: 26.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Text(
                    'Data ini hanya digunakan demi kerepluan riset, dan tidak akan disebarluaskan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFC54C82),
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
