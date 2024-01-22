import 'package:flutter/material.dart';

void main() {
  runApp(const BoilerPlateApp());
}

class BoilerPlateApp extends StatelessWidget {
  const BoilerPlateApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const BoilerPlateAppExample(),
    );
  }
}

class BoilerPlateAppExample extends StatefulWidget {
  const BoilerPlateAppExample({super.key});

  @override
  State<BoilerPlateAppExample> createState() => _BoilerPlateAppExampleState();
}

class _BoilerPlateAppExampleState extends State<BoilerPlateAppExample> {
  bool light0 = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  DateTime date = DateTime.now();
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFF182949),
        title: const TextStyleApp(),
        actions: <Widget>[
          Switch(
              activeColor: const Color(0xff4b6eb1),
              thumbColor: const MaterialStatePropertyAll(Color(0xffffffff)),
              value: light0,
              onChanged: (bool value) {
                setState(() {
                  light0 = value;
                  if (value == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('switch를 ON하였습니다'),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {},
                        ),
                      ),
                    );
                  }
                });
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff182949),
              ),
              child: TextStyleApp(),
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Color(0xFF7B7A7A)),
              title: DrawerListileApp(),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(19, 35, 0, 23),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'DAY 8',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                height: 0.8,
              ),
            ),
          ),
          Card(
            elevation: 0,
            shape: const ContinuousRectangleBorder(
              side: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.12),
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: SizedBox(
              width: 370,
              height: 197,
              child: Column(
                children: <Widget>[
                  const ListTile(
                    title: Padding(
                      padding: EdgeInsets.fromLTRB(16, 14, 16, 12),
                      child: Text(
                        'BoilerPlate4',
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 0.15,
                            height: 1.2,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                      child: Text(
                          '어느덧 SODA 캠프 8일차가 되었네요!\n여기까지 달려오시느라 수고 많으셨어요 :)\n\n아래 있는 CANCEL과 SUBMIT은 버튼입니다 !!'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'CANCEL',
                          style:
                              TextStyle(color: Color.fromRGBO(75, 110, 177, 1)),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'SUBMIT',
                          style:
                              TextStyle(color: Color.fromRGBO(75, 110, 177, 1)),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              3,
              (int index) {
                return ChoiceChip(
                  selectedColor: Color.fromRGBO(24, 41, 73, 1),
                  label: Text('SODA'),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                );
              },
            ).toList(),
          ),
          Expanded(child: Container()),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 30),
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      shape: const ContinuousRectangleBorder(),
                      backgroundColor: const Color(0xffffffff),
                      title: const Text('+버튼을 누르셨습니다',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                              letterSpacing: 0.25,
                              color: Color.fromRGBO(0, 0, 0, 0.6))),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, '확인'),
                          child: const Text(
                            '확인',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 1.14,
                                letterSpacing: 1.25,
                                color: Color.fromRGBO(24, 41, 73, 1)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                backgroundColor: const Color(0xff182949),
                child: const Icon(Icons.add, color: Color(0xffffffff)),
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            indent: 13,
            endIndent: 14,
            color: Color.fromRGBO(33, 33, 33, 1),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(65, 13, 64, 13),
            child: Text('Copyright 2022 SODA  All rights reserved.'),
          ),
        ],
      ),

      //bottomSheet: ,
    );
  }
}

class TextStyleApp extends StatelessWidget {
  const TextStyleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'SODA',
      style: TextStyle(
        fontSize: 20,
        height: 1.2,
        color: Color(0xFFFFFFFF),
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),
    );
  }
}

class TextStyleApp2 extends StatelessWidget {
  const TextStyleApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('This is List tile',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
            fontSize: 20,
            fontFamily: String.fromEnvironment('Roboto'),
            height: 1.2));
  }
}

class DrawerListileApp extends StatelessWidget {
  const DrawerListileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Text(
        'Icon:favorite',
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 0.6),
          letterSpacing: 0.1,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
