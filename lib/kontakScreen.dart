import 'package:flutter/material.dart';

class KontakScreen extends StatefulWidget {
  @override
  ExpansionTileSample createState() => ExpansionTileSample();
}

class ExpansionTileSample extends State<KontakScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Myriad-Pro',
        accentColor: Color(0xFFC54C82),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFFC54C82),
              ),
              onPressed: () {
                Navigator.pop(context, true);
              }),
          title: Text(
            'Kontak',
            style: TextStyle(color: Color(0xFFC54C82), fontSize: 26.0),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  final String title;
  final List<Entry> children;

  Entry(this.title, [this.children = const <Entry>[]]);
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Bandung Cancer Society',
    <Entry>[
      Entry('Facebook: www.facebook.com/BCSBandungCancerSociety'),
      Entry('Yanti Setiawadi (081222120971)'),
    ],
  ),
  Entry(
    'Yayasan Kesehatan Payudara Jawabarat (YKP)',
    <Entry>[
      Entry('Alamat: Jl. Hegarmanah 3 Bandung 40141'),
      Entry('Telepon: (022) 2034313'),
      Entry('Fax: (022) 2501259'),
      Entry('Hotline:', <Entry>[
        Entry('081316315270'),
        Entry('0811223025'),
      ]),
    ],
  ),
  Entry(
    'Yayasan Kanker Indonesia (YKI)',
    <Entry>[
      Entry('Alamat: Jl. Kejaksaan No4.3, Bandung 40112'),
      Entry('Telepon: (022) 4230240'),
      Entry('Email:  ykijabar@bdg.centrin.net.id'),
      Entry('Website: http://www.yayasankankerindonesia.org'),
    ],
  ),
  Entry(
    'BPJS Kesehatan Kantor Divisi Regional Jawa Barat',
    <Entry>[
      Entry('Alamat : Jl. Dr. Djundjunan No.144 PO BOX 1617 Bandung 40163'),
      Entry('Telepon : (022) 2005892, 2013174'),
    ],
  ),
  Entry(
    'BPJS Kesehatan Bandung (Kota Bandung, Kab. Cimahi, Kab. Bandung Barat)',
    <Entry>[
      Entry('Alamat : Jl. Pelajar Pejuang 45 No.66 Bandung 40263'),
      Entry('Telepon :', <Entry>[
        Entry('(022) 7317058'),
        Entry('(022) 7307734'),
        Entry('(022) 7305693'),
        Entry('(022) 7315572'),
      ]),
      Entry('Hotline: 0812 20444445'),
    ],
  ),
  Entry(
    'BPJS KESEHATAN SOREANG (Kab. Bandung)',
    <Entry>[
      Entry('Alamat : Jl. Terusan Alfathu No.6, Soreang, Kab. Bandung'),
      Entry('Telepon:', <Entry>[
        Entry('(022) 88886276'),
        Entry('(022) 88886277'),
      ]),
      Entry('0811 2001504'),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
