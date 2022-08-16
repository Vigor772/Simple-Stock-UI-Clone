import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Stock UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Stock UI Clone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = 'Ian Jeferson Salac';
  String role = 'Wild Hustler';
  ScrollController control = ScrollController();
  late Widget icon;
  var selected = 3;
  List tabs1 = [
    'Personal Data',
    'Settings',
    'E-Statement',
    'Referral Code',
  ];
  List tabs2 = ['FAQs', 'Our HandBook', 'Community'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        controller: control,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(top: 15, left: 15),
                  height: 75,
                  width: 75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/bata_ian.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 7),
                      child: Text(name,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Thesadith',
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 7),
                        child: Text(role,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 15, fontFamily: 'Thesadith'))),
                  ],
                )
              ],
            ),
            SizedBox(height: 40),
            const Divider(
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: tabs1.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    icon = Icon(Icons.person);
                  } else if (index == 1) {
                    icon = Icon(Icons.settings);
                  } else if (index == 2) {
                    icon = Icon(Icons.note);
                  } else if (index == 3) {
                    icon = Icon(Icons.insert_invitation);
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              color: Colors.grey[100],
                              height: 35,
                              width: 35,
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: ClipRRect(child: icon)),
                          Container(
                            width: 130,
                            child: Text(tabs1[index],
                                style: TextStyle(
                                    fontFamily: 'Thesadith', fontSize: 17)),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 100),
                              height: 35,
                              width: 35,
                              child: ClipRRect(
                                  child: Icon(Icons.keyboard_arrow_right))),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  );
                }),
            SizedBox(height: 10),
            const Divider(
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: tabs2.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    icon = Icon(Icons.live_help);
                  } else if (index == 1) {
                    icon = Icon(Icons.border_color);
                  } else if (index == 2) {
                    icon = Icon(Icons.people);
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              color: Colors.grey[100],
                              height: 35,
                              width: 35,
                              margin: EdgeInsets.only(left: 15, right: 15),
                              child: ClipRRect(child: icon)),
                          Container(
                            width: 130,
                            child: Text(tabs2[index],
                                style: TextStyle(
                                    fontFamily: 'Thesadith', fontSize: 17)),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 100),
                              height: 35,
                              width: 35,
                              child: ClipRRect(
                                  child: Icon(Icons.keyboard_arrow_right))),
                        ],
                      ),
                      SizedBox(height: 15),
                    ],
                  );
                }),
            Container(
                decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                margin: EdgeInsets.only(left: 3, right: 10),
                height: 70,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.headset_mic, color: Colors.purple[200]),
                    Text('Feel Free to Ask, We Ready To Help',
                        style: TextStyle(
                            fontFamily: 'Thesadith',
                            fontWeight: FontWeight.bold,
                            color: Colors.purple[200])),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.pinkAccent,
        currentIndex: selected,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: 'Extras'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
