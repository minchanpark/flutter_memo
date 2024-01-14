import 'package:flutter/material.dart';
import 'package:flutter_memo/memo_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MemoProvider()),
      ],
      child: MaterialApp(
        title: 'Memo App',
        home: HomePage(),
      ),
    );
  }
}
