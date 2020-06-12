import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 무작위로 선택된 2개의 단어로 구성된 문자열 생성 
    //final wordPair = WordPair.random();

    return MaterialApp(
      title: 'Startup Name Generator 1',
      home: RandomWords(),
    );
  }
}


class RandomWordsState extends State<RandomWords>{
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    //final WordPair wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar:AppBar(
        title: Text('Startup Name Generator 2'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      //itemBuilder 콜백은 제안된 단어쌍 마다 한번씩 호출되며 각 제안은 ListTile 행에 배치된다.
      //짝수행의 경우 이 함수는 단어쌍에 대해 ListTile 행을 추가 한다.
      //홀수행의 경우 이 함수는 시각적 구분을 위해 Divider 위젯을 추가한다.
      //작은 디바이스에서는 divider 가 잘 보이지 않을 수 있다.
      itemBuilder: (BuildContext _context, int i){
        
        //홀수행의 경우 ListView 의 각 행 앞에 1픽셀 높이의 divider 위젯 추가
        if (i.isOdd) {
          return Divider();
        }
        
        //i ~/ 2 => i 를 2로 나눈 정수 결과(나머지 버림)
        //ListView 의 실제 단어쌍 수에서 divider 위젯을 뺀 값을 계산한다.
        final int index = i ~/ 2;
        
        //만약 마지막 단어쌍일 경우
        if (index >= _suggestions.length) {
          //suggetsions list 에 10개 더 생성하여 추가한다.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase, style: _biggerFont,),
    );
  }
}

//RandomWords 클래스는 RandomWordsState 를 생성하기 위한 용도
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}