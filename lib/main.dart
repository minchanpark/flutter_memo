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
      theme: ThemeData(
        useMaterial3: false,
      ),
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
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0XFF182949),
        title: const TextStyleApp(),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: const Drawer(
        child: ListViewInDrawer(),
      ),
      body: const ShowBodyContent(),
      floatingActionButton: ShowToolTips(),
    );
  }
}

class ListViewInDrawer extends StatelessWidget {
  const ListViewInDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}

class ShowBodyContent extends StatefulWidget {
  const ShowBodyContent({super.key});

  @override
  State<ShowBodyContent> createState() => _ShowBodyContentState();
}

class _ShowBodyContentState extends State<ShowBodyContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const CardTitle(),
        const CardExample(),
        const ShowChoiceChip(),
        Expanded(child: Container()),
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
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class CardExample extends StatefulWidget {
  const CardExample({super.key});

  @override
  State<CardExample> createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 1,
      shape: ContinuousRectangleBorder(
        side: BorderSide(
          color: Color.fromRGBO(0, 0, 0, 0.12),
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: ContentInCard(),
    );
  }
}

class ContentInCard extends StatefulWidget {
  const ContentInCard({super.key});

  @override
  State<ContentInCard> createState() => _ContentInCardState();
}

class _ContentInCardState extends State<ContentInCard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 349,
      height: 197,
      child: Column(
        children: <Widget>[
          ListTileExample(),
          TextButtonExample(),
        ],
      ),
    );
  }
}

class ListTileExample extends StatelessWidget {
  const ListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      title: Padding(
        padding: EdgeInsets.fromLTRB(0, 14, 16, 12),
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
        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: Text(
            '어느덧 SODA 캠프 8일차가 되었네요!\n여기까지 달려오시느라 수고 많으셨어요 :)\n\n아래 있는 CANCEL과 SUBMIT은 버튼입니다 !!'),
      ),
    );
  }
}

class TextButtonExample extends StatefulWidget {
  const TextButtonExample({super.key});

  @override
  State<TextButtonExample> createState() => _TextButtonExampleState();
}

class _TextButtonExampleState extends State<TextButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text(
            'CANCEL',
            style: TextStyle(color: Color.fromRGBO(75, 110, 177, 1)),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'SUBMIT',
            style: TextStyle(color: Color.fromRGBO(75, 110, 177, 1)),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

class ShowChoiceChip extends StatefulWidget {
  const ShowChoiceChip({super.key});

  @override
  State<ShowChoiceChip> createState() => _ShowChoiceChipState();
}

class _ShowChoiceChipState extends State<ShowChoiceChip> {
  int? _value = 1;
  List<String> item = ['SODA', 'CAMP', 'FUN', 'FLUTTER'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 13, 0, 0),
      alignment: Alignment.bottomLeft,
      child: Wrap(
        spacing: 10.0,
        children: List<Widget>.generate(
          4,
          (int index) {
            return ChoiceChip(
              selectedColor: const Color.fromRGBO(24, 41, 73, 1),
              label: Text(item[index]),
              selected: _value == index,
              labelStyle: TextStyle(
                  color: index == _value ? Colors.white : Colors.black),
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}

class ShowToolTips extends StatelessWidget {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  ShowToolTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: tooltipkey,
      triggerMode: TooltipTriggerMode.tap,
      showDuration: const Duration(seconds: 3),
      message: 'Tooltip',
      padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: FloatingActionButton(
          onPressed: () {},
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          backgroundColor: const Color(0xff182949),
          child: const Icon(Icons.add, color: Color(0xffffffff)),
        ),
      ),
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
