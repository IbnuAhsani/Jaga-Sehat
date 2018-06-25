import './homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String selectedJk, selectedPendidikan, selectedPekerjaan;
  Item item;
  List<Item> items = List();
  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    item = Item("", "", "", "", "");
    final FirebaseDatabase database = FirebaseDatabase.instance;
    itemRef = database.reference().child('data_pengguna');
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
        accentColor: Color(0xFFC54C82),
        primaryColor: Color(0xFFC54C82),
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          title: Text(
            'jaga sehat',
            style: TextStyle(
              color: Color(0xFFC54C82),
              fontFamily: 'Kelvetica',
              fontSize: 26.0,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.help,
                color: Color(0xFFC54C82),
              ),
              onPressed: () => _disclaimerDialog(context),
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image(
              image: AssetImage("assets/background/login_background.jpg"),
              fit: BoxFit.cover,
              color: Colors.black38,
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Center(
              child: Card(
                elevation: 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      height: 160.0,
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/logo/logo3.png'),
                        ),
                        border: Border.all(
                          color: Color(0xFF512E67),
                          width: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        top: 12.0,
                        bottom: 12.0,
                      ),
                      child: Text(
                        'Form Data Demografi',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Color(0xFFC54C82),
                        ),
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: ListTile(
                                  dense: true,
                                  leading: const Icon(
                                    Icons.person,
                                    color: const Color(0xFFC54C82),
                                  ),
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      DropdownButton<String>(
                                        hint: Text('Kelamin'),
                                        value: selectedJk,
                                        onChanged: (newVal) {
                                          item.jk = newVal;
                                          setState(() {
                                            selectedJk = newVal;
                                          });
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  dense: true,
                                  leading: const Icon(
                                    Icons.calendar_today,
                                    color: const Color(0xFFC54C82),
                                  ),
                                  title: TextFormField(
                                    decoration:
                                        InputDecoration(hintText: "Usia"),
                                    keyboardType: TextInputType.number,
                                    initialValue: "",
                                    onSaved: (val) => item.usia = val,
                                    validator: (value) => value.isEmpty
                                        ? 'Email can\'t be empty'
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: ListTile(
                              leading: const Icon(
                                Icons.import_contacts,
                                color: const Color(0xFFC54C82),
                              ),
                              title: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  DropdownButton<String>(
                                    hint: Text('Tingkat Pendidikan'),
                                    value: selectedPendidikan,
                                    onChanged: (newVal) {
                                      item.pendidikan = newVal;
                                      setState(() {
                                        selectedPendidikan = newVal;
                                      });
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              leading: const Icon(
                                Icons.work,
                                color: const Color(0xFFC54C82),
                              ),
                              title: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  DropdownButton<String>(
                                    hint: Text('Pekerjaan'),
                                    value: selectedPekerjaan,
                                    onChanged: (newVal) {
                                      item.pekerjaan = newVal;
                                      setState(() {
                                        selectedPekerjaan = newVal;
                                      });
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListTile(
                              leading: const Icon(
                                Icons.email,
                                color: const Color(0xFFC54C82),
                              ),
                              title: TextFormField(
                                decoration: InputDecoration(hintText: "Email"),
                                initialValue: "",
                                onSaved: (val) => item.email = val,
                                validator: (value) => value.isEmpty
                                    ? 'Email can\'t be empty'
                                    : null,
                              ),
                            ),
                          ),
                          Container(
                            width: screenSize.width,
                            margin: EdgeInsets.all(20.0),
                            child: RaisedButton(
                              color: Color(0xFF512E67),
                              child: Text(
                                'Unggah',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                handleSubmit();
                                var routes = MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeScreen(),
                                );
                                Navigator.of(context).pushReplacement(routes);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),
            
          ],
        ),
      ),
    );
  }
}

_disclaimerDialog(BuildContext context) {
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
                Icon(
                  Icons.lock_outline,
                  color: Color(0xFFC54C82),
                  size: 96.0,
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

class Item {
  String key, jk, usia, pendidikan, pekerjaan, email;

  Item(this.jk, this.usia, this.pendidikan, this.pekerjaan, this.email);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        jk = snapshot.value["jk"],
        usia = snapshot.value["usia"],
        pendidikan = snapshot.value["pendidikan"],
        pekerjaan = snapshot.value["pekerjaan"],
        email = snapshot.value["email"];

  toJson() {
    return {
      "jk": jk,
      "usia": usia,
      "pendidikan": pendidikan,
      "pekerjaan": pekerjaan,
      "email": email,
    };
  }
}