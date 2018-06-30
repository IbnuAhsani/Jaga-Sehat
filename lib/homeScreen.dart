import './kontakScreen2.dart';
import './literasiScreen.dart';
import './reusableWidgets.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text =
      "jaga sehat adalah aplikasi Literasi Kesehatan mengenai penyakit Kanker Payudara, yang terdiri dari fitur Literasi dan juga Kontak dari beberapa lembaga kesehatan.\n Aplikasinya bisa diunduh di -->";
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
      ),
      home: Scaffold(
        appBar: CustomAppBar2(),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: RaisedButton(
                    elevation: 1.5,
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
                    elevation: 1.5,
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
                Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: RaisedButton(
                        elevation: 1.5,
                        padding: EdgeInsets.all(40.0),
                        color: Color(0xFFFF6699),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              size: 60.0,
                              color: Colors.white,
                            ),
                            Text(
                              'Bagikan',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 36.0),
                            ),
                          ],
                        ),
                        onPressed: () {
                          final RenderBox box = context.findRenderObject();
                          Share.share(text,
                              sharePositionOrigin:
                                  box.localToGlobal(Offset.zero) & box.size);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
