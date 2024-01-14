// memo_list.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memo_provider.dart';

class MemoList extends StatelessWidget {
  const MemoList({super.key});

  @override
  Widget build(BuildContext context) {
    var memos = Provider.of<MemoProvider>(context).memos;

    return ListView.builder(
      itemCount: memos.length,
      itemBuilder: (context, index) {
        var memo = memos[index];
        return ListTile(
          title: Text(memo.title),
          subtitle: Text(memo.content),
        );
      },
    );
  }
}
