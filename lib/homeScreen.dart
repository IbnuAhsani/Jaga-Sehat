import './kontakScreen2.dart';
import './literasiScreen.dart';
import './backgrounds.dart';
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

  void share() {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  void navigate(MaterialPageRoute route) {
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    var literasiRoute =
        MaterialPageRoute(builder: (BuildContext context) => LiterasiScreen());
    var kontakRoute =
        MaterialPageRoute(builder: (BuildContext context) => KontakScreen2());

    var literasiButton1 = customContainer(
      true,
      RaisedButton(
        elevation: 1.5,
        padding: EdgeInsets.all(40.0),
        color: Color(0xFFC54C82),
        child: customPlacement(true, 'Literasi', Icons.import_contacts),
        onPressed: () {
          Navigator.of(context).push(literasiRoute);
        },
      ),
    );

    var kontakButton1 = customContainer(
      true,
      RaisedButton(
        elevation: 1.5,
        padding: EdgeInsets.all(40.0),
        color: Color(0xFF512E67),
        child: customPlacement(true, 'Kontak', Icons.contact_phone),
        onPressed: () {
          Navigator.of(context).push(kontakRoute);
        },
      ),
    );
    var literasiButton2 = customContainer(
      false,
      RaisedButton(
        elevation: 1.5,
        padding: EdgeInsets.all(40.0),
        color: Color(0xFFC54C82),
        child: customPlacement(false, 'Literasi', Icons.import_contacts),
        onPressed: () {
          Navigator.of(context).push(literasiRoute);
        },
      ),
    );

    var kontakButton2 = customContainer(
      false,
      RaisedButton(
        elevation: 1.5,
        padding: EdgeInsets.all(40.0),
        color: Color(0xFF512E67),
        child: customPlacement(false, 'Kontak', Icons.contact_phone),
        onPressed: () {
          Navigator.of(context).push(kontakRoute);
        },
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
      ),
      home: Scaffold(
        appBar: CustomAppBar2(),
        body: Stack(
          children: <Widget>[
            Positioned(
              child: HomeScreenOverlay(Color(0xFFC54C82), Color(0xFF512E67), Color(0xFFFF6699)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return Center(
                  child: orientation == Orientation.portrait
                      ? Center(
                          child: Container(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                literasiButton1,
                                kontakButton1,
                                Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                          top: 20.0, bottom: 20.0),
                                      child: RaisedButton(
                                        elevation: 1.5,
                                        padding: EdgeInsets.all(40.0),
                                        color: Color(0xFFFF6699),
                                        child: customPlacement(
                                            true, 'Bagikan', Icons.share),
                                        onPressed: share,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            padding: EdgeInsets.only(left: 16.0, right: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                literasiButton2,
                                kontakButton2,
                                Builder(
                                  builder: (BuildContext context) {
                                    return customContainer(
                                      false,
                                      RaisedButton(
                                        elevation: 1.5,
                                        padding: EdgeInsets.all(40.0),
                                        color: Color(0xFFFF6699),
                                        child: customPlacement(
                                            false, 'Bagikan', Icons.share),
                                        onPressed: share,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget customPlacement(bool p, String text, IconData icon) {
  if (p == true) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
          color: Colors.white,
        ),
        Text(
          '$text',
          style: TextStyle(
            color: Colors.white,
            fontSize: 36.0,
          ),
        ),
      ],
    );
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        icon,
        size: 60.0,
        color: Colors.white,
      ),
      Text(
        '$text',
        style: TextStyle(
          color: Colors.white,
          fontSize: 36.0,
        ),
      ),
    ],
  );
}

Widget customContainer(bool p, Widget button) {
  if (p == true) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: button,
    );
  }
  return Container(
    margin: EdgeInsets.all(9.0),
    child: button,
  );
}
