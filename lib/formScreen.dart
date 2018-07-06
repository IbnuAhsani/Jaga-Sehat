import './homeScreen.dart';
import './reusableWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool validateJk, validateUsia, validatePen, validatePek;
  String selectedJk, selectedUsia, selectedPendidikan, selectedPekerjaan;
  Map<String, String> timeStamp;
  Item item;
  List<Item> items = List();
  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    validateJk = false;
    validateUsia = false;
    validatePen = false;
    validatePek = false;
    item = Item(
        "kosong", "kosong", "kosong", "kosong", null, ServerValue.timestamp);
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('data_pengguna');
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      // form.reset();
      itemRef.push().set(item.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    var jkDropdown = DropdownButton<String>(
      hint: Text('Kelamin'),
      value: selectedJk,
      onChanged: (newVal) {
        if (newVal.isNotEmpty) {
          item.jk = newVal;
          setState(() {
            selectedJk = newVal;
            validateJk = true;
          });
        }
      },
      items: <String>[
        'Pria',
        'Wanita',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    var jkInput = Flexible(
      flex: 1,
      child: ListTile(
        dense: true,
        leading: CustomIcon(Icons.person),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            jkDropdown,
          ],
        ),
      ),
    );

    var usiaDropdown = DropdownButton<String>(
      hint: Text('Usia'),
      value: selectedUsia,
      onChanged: (newVal) {
        if (newVal.isNotEmpty) {
          item.usia = newVal;
          setState(() {
            selectedUsia = newVal;
            validateUsia = true;
          });
        }
      },
      items: <String>[
        '6 - 17',
        '18 - 29',
        '30 - 45',
        '46 - 60',
        '60+',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    var usiaInput = Flexible(
      child: ListTile(
        leading: CustomIcon(Icons.calendar_today),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[usiaDropdown],
        ),
      ),
    );

    var penDropdown = DropdownButton<String>(
      hint: Text('Tingkat Pendidikan'),
      value: selectedPendidikan,
      onChanged: (newVal) {
        if (newVal.isNotEmpty) {
          item.pendidikan = newVal;
          setState(() {
            selectedPendidikan = newVal;
            validatePen = true;
          });
        }
      },
      items: <String>[
        'SD',
        'SMP',
        'SMA',
        'Perguruan Tinggi',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    var penInput = Flexible(
      child: ListTile(
        leading: CustomIcon(Icons.import_contacts),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[penDropdown],
        ),
      ),
    );

    var pekDropdown = DropdownButton<String>(
      hint: Text('Pekerjaan'),
      value: selectedPekerjaan,
      onChanged: (newVal) {
        if (newVal.isNotEmpty) {
          item.pekerjaan = newVal;
          setState(() {
            selectedPekerjaan = newVal;
            validatePek = true;
          });
        }
      },
      items: <String>[
        'PNS',
        'Pegawai Swasta',
        'Wiraswasta',
        'Mahasiswa',
        'Pelajar',
        'Lainnya'
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    var pekInput = Flexible(
      child: ListTile(
        leading: CustomIcon(Icons.work),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            pekDropdown,
          ],
        ),
      ),
    );

    var emailTextField = TextFormField(
      decoration: InputDecoration(hintText: "Email"),
      onSaved: (val) =>
          val.isEmpty ? item.email = 'Tidak punya email' : item.email = val,
    );

    var emailInput = Flexible(
      child: ListTile(
        leading: CustomIcon(Icons.email),
        title: emailTextField,
      ),
    );

    Function isButtonActive() {
      if (validateJk && validateUsia && validatePen && validatePek == true) {
        return () {
          handleSubmit();
          var routes = MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          );
          Navigator.of(context).pushReplacement(routes);
        };
      } else {
        return null;
      }
    }

    ;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
        primaryColor: Color(0xFFC54C82),
        accentColor: Color(0xFFC54C82),
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: CustomAppBar1(),
        body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/background/login_background.jpg"),
                  fit: BoxFit.cover,
                  color: Colors.black38,
                  colorBlendMode: BlendMode.darken,
                ),
                orientation == Orientation.portrait
                    ? Container(
                        margin: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Center(
                          child: Card(
                            elevation: 0.5,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Logo(80.0),
                                FormTitle(24.0),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          jkInput,
                                          usiaInput,
                                        ],
                                      ),
                                      penInput,
                                      pekInput,
                                      emailInput,
                                      CustomButton(screenSize.width, isButtonActive()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: Center(
                          child: Card(
                            elevation: 0.5,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 16.0,
                                bottom: 12.0,
                              ),
                              child: Form(
                                key: formKey,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Logo(120.0),
                                          FormTitle(20.0),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 16.0, right: 8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              CustomIcon(Icons.person),
                                              RowDivider(16.0),
                                              jkDropdown,
                                              RowDivider(46.0),
                                              CustomIcon(Icons.calendar_today),
                                              RowDivider(16.0),
                                              usiaDropdown
                                            ],
                                          ),
                                          CustomRow(Icons.import_contacts,
                                              penDropdown),
                                          CustomRow(
                                            Icons.email,
                                            Container(
                                              width: 255.0,
                                              child: emailTextField,
                                            ),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              CustomIcon(Icons.work),
                                              RowDivider(16.0),
                                              pekDropdown,
                                              RowDivider(8.0),
                                              CustomButton(100.0, isButtonActive()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class RowDivider extends Container {
  RowDivider(double d) : super(margin: EdgeInsets.only(right: d));
}

class CustomIcon extends Icon {
  CustomIcon(IconData icon) : super(icon, color: Color(0xFFC54C82));
}

class CustomRow extends StatelessWidget {
  final IconData icon;
  final Widget widget;

  CustomRow(this.icon, this.widget);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CustomIcon(this.icon),
        RowDivider(16.0),
        this.widget,
      ],
    );
  }
}

class Logo extends StatelessWidget {
  final double radius;

  Logo(this.radius);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.radius,
      height: this.radius,
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/logo/logo3.png'),
        ),
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  final double fontSize;

  FormTitle(this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.0,
        bottom: 12.0,
      ),
      child: Text(
        'Form Data Demografi',
        style: TextStyle(
          fontSize: fontSize,
          color: Color(0xFFC54C82),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final double width;
  final Function function;

  CustomButton(this.width, this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.all(20.0),
      child: RaisedButton(
        color: Color(0xFF512E67),
        child: Text(
          'Unggah',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: function,
      ),
    );
  }
}

class Item {
  String key, jk, usia, pendidikan, pekerjaan, email;
  Map<String, String> timeStamp;

  Item(this.jk, this.usia, this.pendidikan, this.pekerjaan, this.email,
      this.timeStamp);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        jk = snapshot.value["jk"],
        usia = snapshot.value["usia"],
        pendidikan = snapshot.value["pendidikan"],
        pekerjaan = snapshot.value["pekerjaan"],
        email = snapshot.value["email"],
        timeStamp = ServerValue.timestamp;

  toJson() {
    return {
      "jk": jk,
      "usia": usia,
      "pendidikan": pendidikan,
      "pekerjaan": pekerjaan,
      "email": email,
      "time_stamp": timeStamp,
    };
  }
}
