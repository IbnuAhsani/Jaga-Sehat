import './homeScreen.dart';
import './reusableWidgets.dart';
import './backgrounds.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KontakScreen2 extends StatefulWidget {
  _KontakScreen2 createState() => _KontakScreen2();
}

class _KontakScreen2 extends State<KontakScreen2> {
  @override
  Widget build(BuildContext context) {
    var backButton = IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xFFC54C82),
        ),
        onPressed: () {
          Navigator.pop(context, true);
        });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
        accentColor: Color(0xFFC54C82),
      ),
      home: Scaffold(
        appBar: CustomAppBar3(
          button: backButton,
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              child: SingleColorOverlay(Color(0xFF512E67)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return Container(
                  margin: orientation == Orientation.portrait
                      ? EdgeInsets.only(right: 10.0, left: 10.0)
                      : EdgeInsets.only(right: 128.0, left: 128.0),
                  child: ListView(
                    children: <Widget>[
                      CardWidget('assets/pic/bcs.png', dataBcs),
                      CardWidget('assets/pic/place_holder.jpg', dataYkp),
                      CardWidget('assets/pic/yki.jpg', dataYki),
                      CardWidget('assets/pic/bpjs_jabar.jpg', dataBpjsJ),
                      CardWidget('assets/pic/bpjs_bandung.jpg', dataBpjsB),
                      CardWidget('assets/pic/bpjs_soreang.jpg', dataBpjsS),
                    ],
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

_launchUrl(String uri) async {
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

class NameWidget extends StatelessWidget {
  final String name;

  NameWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Center(
        child: Text(
          '$name',
          style: TextStyle(
            color: Color(0xFFC54C82),
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String data, type;

  ListTileWidget(this.data, this.type);

  @override
  Widget build(BuildContext context) {
    if (type == 'phone') {
      return Expanded(
        child: ListTile(
          dense: true,
          leading: IconButton(
            icon: Icon(
              Icons.phone,
              color: Color(0xFFC54C82),
            ),
            onPressed: () {
              _launchUrl('tel:$data');
            },
          ),
          title: Text(
            '$data',
            style: TextStyle(fontSize: 11.0),
          ),
        ),
      );
    } else if (type == 'alamat') {
      return Container(
        margin: EdgeInsets.only(left: 8.0),
        child: ListTile(
          dense: true,
          leading: Icon(
            Icons.map,
            color: Color(0xFFC54C82),
          ),
          title: Text('$data'),
        ),
      );
    } else if (type == 'email') {
      return ListTile(
        dense: true,
        leading: IconButton(
          icon: Icon(
            Icons.email,
            color: Color(0xFFC54C82),
          ),
          onPressed: () {
            _launchUrl('mailto:$data');
          },
        ),
        title: Text(
          '$data',
          style: TextStyle(fontSize: 12.0),
        ),
      );
    } else if (type == 'web') {
      return ListTile(
        dense: true,
        leading: IconButton(
          icon: Icon(
            Icons.desktop_windows,
            color: Color(0xFFC54C82),
          ),
          onPressed: () {
            _launchUrl('http:$data');
          },
        ),
        title: Text(
          '$data',
          style: TextStyle(fontSize: 12.0),
        ),
      );
    } else if (type == 'fax') {
      return Container(
          margin: EdgeInsets.only(left: 8.0),
          child: ListTile(
            dense: true,
            leading: Icon(
              Icons.print,
              color: Color(0xFFC54C82),
            ),
            title: Text('$data'),
          ));
    } else if (type == 'fb') {
      return Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: 16.0,
              right: 10.0,
            ),
            child: IconButton(
              icon: Image.asset(
                'assets/icon/fb.png',
                scale: 1.5,
              ),
              onPressed: () {
                _launchUrl(
                    'http://id-id.facebook.com/BCSBandungCancerSociety/');
              },
            ),
          ),
          Text('$data'),
        ],
      );
    }
  }
}

class CardWidget extends StatelessWidget {
  final String assetPath;
  final List<Widget> extraWidget;

  CardWidget(this.assetPath, this.extraWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Card(
          elevation: 0.5,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  '$assetPath',
                  fit: BoxFit.fitWidth,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: extraWidget,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

var dataBcs = <Widget>[
  NameWidget('Bandung Cancer Society'),
  Divider(),
  ListTileWidget('/BCSBandungCancerSociety', 'fb'),
  Divider(),
  Flex(
    direction: Axis.vertical,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('081222120971', 'phone'),
        ],
      ),
    ],
  ),
];

var dataYkp = <Widget>[
  NameWidget('Yayasan Kesehatan Payudara Jawa Barat'),
  Divider(),
  ListTileWidget('Jl. Hegarmanah 3 Bandung 40141', 'alamat'),
  Divider(),
  ListTileWidget('0222501259', 'fax'),
  Divider(),
  Flex(
    direction: Axis.vertical,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('0222034313', 'phone'),
          ListTileWidget('081316315270', 'phone'),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('0811223025', 'phone'),
        ],
      ),
    ],
  ),
];

var dataYki = <Widget>[
  NameWidget('Yayasan Kanker Indonesia'),
  Divider(),
  ListTileWidget('Jl. Kejaksaan No. 43, Bandung 40112', 'alamat'),
  Divider(),
  ListTileWidget('ykijabar@bdg.centrin.net.id', 'email'),
  Divider(),
  ListTileWidget('www.yayasankankerindonesia.org', 'web'),
  Divider(),
  Flex(
    direction: Axis.vertical,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('0224230240', 'phone'),
        ],
      ),
    ],
  ),
];

var dataBpjsJ = <Widget>[
  NameWidget('BPJS Kesehatan Jawa Barat'),
  Divider(),
  ListTileWidget(
      'Jl. Dr. Djundjunan No.144 PO BOX 1617 Bandung 40163', 'alamat'),
  Divider(),
  Flex(
    direction: Axis.vertical,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('0222005892', 'phone'),
          ListTileWidget('0222013174', 'phone'),
        ],
      ),
    ],
  ),
];

var dataBpjsB = <Widget>[
  NameWidget('BPJS Kesahata Bandung'),
  Divider(),
  ListTileWidget('Jl. Pelajar Pejuang 45 No.66 Bandung 40263', 'alamat'),
  Divider(),
  Flex(
    direction: Axis.vertical,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('0227317058', 'phone'),
          ListTileWidget('0227307734', 'phone'),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('0227305693', 'phone'),
          ListTileWidget('0227315572', 'phone'),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('0227305693', 'phone'),
          ListTileWidget('0227315572', 'phone'),
        ],
      ),
    ],
  ),
];

var dataBpjsS = <Widget>[
  NameWidget('BPJS Kesehatan Soreang'),
  Divider(),
  ListTileWidget('Jl. Terusan Alfathu No.6, Soreang, Kab. Bandung', 'alamat'),
  Divider(),
  Flex(
    direction: Axis.vertical,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('02288886276', 'phone'),
          ListTileWidget('02288886277', 'phone'),
        ],
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileWidget('0811 2001504', 'phone'),
        ],
      ),
    ],
  ),
];
