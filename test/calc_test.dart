// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_practice/calc.dart';
import 'package:test_practice/main.dart';

void main() {
// Unitテスト(単体テスト)
// testメソッドで、テストケース名と処理を記載する
// 処理の中で、expectを用いてテストを行い、実測地と期待値を比べる
  test('test1', () {
    var value1 = 10;
    var value2 = 10;
    var calc = Calc();
    var ans = calc.add(value1, value2);
    expect(ans, 20);
  });

// groupを使うと、testを一定のグループに分けることができる
  group('test2', () {
    var value1 = 10;
    var value2 = 10;
    var calc = Calc();
    test('add test', () {
      var answer = calc.add(value1, value2);
      expect(answer, 20);
    });
    test('minus test', () {
      var answer = calc.sub(value1, value2);
      expect(answer, 0);
    });
  });
}
