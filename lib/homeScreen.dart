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

  void share() {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    var literasiRoute =
        MaterialPageRoute(builder: (BuildContext context) => LiterasiScreen());
    var kontakRoute =
        MaterialPageRoute(builder: (BuildContext context) => KontakScreen2());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
      ),
      home: Scaffold(
        appBar: CustomAppBar2(),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Center(
              child: orientation == Orientation.portrait
                  ? Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Column(
                          children: <Widget>[
                            CustomButton(
                                true,
                                'Literasi',
                                Icons.import_contacts,
                                0xFFC54C82,
                                literasiRoute),
                            CustomButton(true, 'Kontak', Icons.contact_phone,
                                0xFF512E67, kontakRoute),
                            Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  margin:
                                      EdgeInsets.only(top: 20.0, bottom: 20.0),
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
                          children: <Widget>[
                            CustomButton(
                                false,
                                'Literasi',
                                Icons.import_contacts,
                                0xFFC54C82,
                                literasiRoute),
                            CustomButton(false, 'Kontak', Icons.contact_phone,
                                0xFF512E67, kontakRoute),
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
        //
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

class CustomButton extends StatelessWidget {
  bool p;
  final int hexVal;
  final String text;
  final IconData icon;
  final MaterialPageRoute route;

  CustomButton(this.p, this.text, this.icon, this.hexVal, this.route);

  @override
  Widget build(BuildContext context) {
    return customContainer(
      p,
      RaisedButton(
        elevation: 1.5,
        padding: EdgeInsets.all(40.0),
        color: Color(this.hexVal),
        child: customPlacement(this.p, this.text, this.icon),
        onPressed: () {
          Navigator.of(context).push(route);
        },
      ),
    );
  }
}
