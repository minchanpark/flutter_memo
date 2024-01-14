import 'package:flutter/material.dart';
import 'memo.dart';

class MemoProvider extends ChangeNotifier {
  List<Memo> _memos = [];

  List<Memo> get memos => _memos;

  void addMemo(Memo memo) {
    _memos.add(memo);
    notifyListeners();
  }

  void updateMemo(Memo updatedMemo) {
    // 기존 메모를 찾아서 업데이트
    for (int i = 0; i < _memos.length; i++) {
      if (_memos[i] == updatedMemo) {
        _memos[i] = updatedMemo;
        notifyListeners();
        break;
      }
    }
  }
}
