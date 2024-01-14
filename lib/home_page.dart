import 'package:flutter/material.dart';
import 'package:flutter_memo/memo_provider.dart';
import 'package:provider/provider.dart';
import 'memo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
  const MemoList({super.key});

  @override
  Widget build(BuildContext context) {
    //MemoProvider로부터 Memo 리스트를 가져옵니다.
    var memos = Provider.of<MemoProvider>(context).memos;

    //Memo 리스트를 사용하여 ListView를 생성합니다.
    return ListView.builder(
        itemCount: memos.length,
        itemBuilder: (context, index) {
          var memo = memos[index];
          return ListTile(
              title: Text(memo.title),
              subtitle: Text(memo.content),
              onTap: () {
                //메모 상세 페이지로 이동합니다.
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MemoDetailPage(memo: memo),
                    ));
              });
        });
  }
}

class MemoDetailPage extends StatefulWidget {
  final Memo? memo;

  MemoDetailPage({Key? key, this.memo}) : super(key: key);

  @override
  _MemoDetailPageState createState() => _MemoDetailPageState();
}

class _MemoDetailPageState extends State<MemoDetailPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    // 초기값 설정
    _titleController = TextEditingController(text: widget.memo?.title ?? '');
    _contentController =
        TextEditingController(text: widget.memo?.content ?? '');
  }

  @override
  void dispose() {
    // 컨트롤러 해제
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

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
              controller: _titleController,
              onChanged: (value) {
                //제목 변경 이벤트 처리
                setState(() {
                  //변경된 값을 MemoDetailPage의 상태에 업데이트
                  widget.memo?.title = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
                decoration: InputDecoration(labelText: '내용'),
                controller: _contentController,
                onChanged: (value) {
                  //내용변경 이벤트 처리
                  setState(() {
                    widget.memo?.content = value; // 주석 추가: 내용 업데이트
                  });
                }),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                //저장 버튼 클릭 이벤트 처리
                if (widget.memo != null) {
                  Provider.of<MemoProvider>(context, listen: false)
                      .updateMemo(widget.memo!);
                } else {
                  // Memo가 없으면 MemoProvider를 통해 새로운 Memo 추가
                  Provider.of<MemoProvider>(context, listen: false)
                      .addMemo(Memo(
                    title: _titleController.text,
                    content: _contentController.text,
                  ));
                }
                Navigator.pop(context);
              },
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
