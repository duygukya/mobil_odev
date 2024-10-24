import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> firmaNames = [
    "Firma Adı Uzun Firma Adı Firma Adı Uzun Firma Adı",
    "Firma Adı",
    "Firma Adı Uzun Firma Adı Firma Adı Uzun Firma Adı",
    "Firma Adı Uzun Firma Adı",
    "Firma Adı",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firmalar"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // geri gitme
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_hospital, color: Colors.white),
                  SizedBox(width: 10.0),
                  Text(
                    "Sağlık",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Firma Ara",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("İstediğiniz firmada indirim yakalama fırsatı..."),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: firmaNames.length,
              itemBuilder: (context, index) {
                return FirmaListTile(firmaNames[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FirmaListTile extends StatelessWidget {
  final String firmaName;

  FirmaListTile(this.firmaName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: Icon(Icons.label_important),
                title: Text(firmaName),
              ),
            ),
            Container(
              width: 80,
              height: 60,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Text(
                "%10",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
