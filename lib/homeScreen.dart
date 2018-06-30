import 'package:flutter/material.dart';
import 'package:share/share.dart';
import './kontakScreen.dart';
import './kontakScreen2.dart';
import './literasiScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String text =
      "jaga sehat adalah aplikasi Literasi Kesehatan mengenai penyakit Kanker Payudara, yang terdiri dari fitur Literasi dan juga Kontak dari beberapa lembaga kesehatan.\n Aplikasinya bisa diunduh di -->";
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
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: Text(
            'Jaga Sehat',
            style: TextStyle(
              color: Color(0xFFC54C82),
              fontSize: 26.0,
              fontFamily: 'Kelvetica',
            ),
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
              onTap: () => devsDialog(context),
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
                Builder(
                  builder: (BuildContext context) {
                    return Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: RaisedButton(
                        elevation: 2.5,
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

devsDialog(BuildContext context) {
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
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Pengembang Aplikasi',
                    style: TextStyle(
                      color: Color(0xFFC54C82),
                      fontSize: 24.0,
                    ),
                  ),
                ),
                NameWidget(
                    'assets/photo/20.jpg', '140810160020', 'Hasna Karimah'),
                NameWidget(
                    'assets/photo/42.jpg', '140810160042', 'Aditya Rizky F.'),
                NameWidget(
                    'assets/photo/54.jpg', '140810160054', 'Ibnu Ahsani'),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class NameWidget extends StatelessWidget {
  String _npm, _name, _assetPath;

  NameWidget(this._assetPath, this._npm, this._name);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 50.0,
          height: 50.0,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('$_assetPath'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
        ),
        Container(
          height: 40.0,
          width: 1.0,
          color: Color(0xFFC54C82),
          margin: const EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '$_npm',
              style: TextStyle(color: Color(0xFFC54C82), fontSize: 20.0),
            ),
            Text(
              '$_name',
              style: TextStyle(color: Color(0xFF512E67), fontSize: 18.0),
            ),
          ],
        ),
      ],
    );
  }
}
