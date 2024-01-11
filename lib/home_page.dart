import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모장'),
      ),
      body: MemoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MemoDetailPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MemoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var memos = Provider.of<List<Memo>>(context);

    return ListView.builder(
        itemCount: memos.length,
        itemBuilder: (context, index) {
          var memo = memos[index];
          return ListTitle(
              title: Text(memo.title),
              subtitle: Text(memo.content),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemoDetailPage(memo: memo),
                    ));
              });
        });
  }
}

class MemoDetailPage extends StatelessWidget {
  final Memo? memo;

  MemoDetailPage({this.memo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모작성'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: '제목'),
              initialValue: memo?.title ?? '',
              onChanged: (value) {
                //제목 변경 이벤트 처리
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(labelText: '내용'),
                initialValue: memo?.content ?? '',
                onChanged: (value) {
                  //내용변경 이벤트 처리
                }),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                //저장 버튼 클릭 이벤트 처리
              },
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
