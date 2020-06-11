import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 무작위로 선택된 2개의 단어로 구성된 문자열 생성 
    final wordPair = WordPair.random();

    return MaterialApp(
      title: 'Welcome Flutter',
      //Scaffold 위젯의 appBar, title, body 속성 지정
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),  //앱의 타이틀바에 보여질 문자열
          ),
        body: Center( //Center 위젯을 사용하면 자식 위젯이 화면 중앙에 정렬됨
          //child: Text("Hello World"),
           // 단어의 첫글자만 대문자로하여 두 개의 단어를 결합한 문자열을 리턴하여 Text 위젯에 보이도록 합니다.  
          child: Text(wordPair.asPascalCase),
        ),
      )
    );
  }
}
