import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    Center(child: screen1()),
    Center(child: screen2()),
    Center(child: screen3()),
    Center(child: screen4()),
  ];

  int _currentindex=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Midterm'),),
        body: tabs[_currentindex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18.0,
          unselectedFontSize: 14.0,
          iconSize: 30.0,
          currentIndex: _currentindex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
                                    label: 'Home',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.access_alarm),
                                    label: 'Alarm',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.business),
                                    label: 'Business',
                                    ),
            BottomNavigationBarItem(icon: Icon(Icons.school),
                                    label: 'School',
                                    ),
          ],
          onTap: (index) { setState(() {
                                       _currentindex=index;
                                       if (index!=0) {
                                         player.stop();
                                       }
                         });
        },
      ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='我生長在一個幸福的家庭，有著父母無微不至的照顧，'
      '讓我能有快樂的童年，養成了我樂觀開朗的個性，'
      '父母給了我很大程度的自由，讓我能自己選擇自己的路，'
      '培養了我自主獨立的能力，他們也常鼓勵我，使我能有面對挑戰的勇氣。'
      '我從小就很喜歡運動，各種球類運動都有接觸，其中最喜歡的是籃球，'
      '上高中也喜歡上了畫圖和拆裝電腦，對於寫程式也有一些興趣。'
      '國中因為補習班的數學老師幽默風趣，而讓我對數學特別感興趣，'
      '受到此影響，國中會考數學拿了A，最後高中填進了室內空間設計科，'
      '在班上雖然我的成績不錯，但內心覺得這不是我想走的路，'
      '而在二年級上學期的時候轉到資訊科，老實說當時非常的不安，'
      '但憑藉著我的努力，在轉進資訊科後的第一次段考就獲得了班上第5名的成績，'
      '這對我來說無疑是個喜訊，代表著我的努力得到了回報，也增添了我的信心，'
      '接下來的我在班上取得前3名的成績，得到許多同學和老師的認可，'
      '成功地在班上佔有一席之地，我認為我比其他人特別的是，我是一名轉科生，'
      '我比別人少讀一年的時間，但我卻能得到這樣的成績，我不認為是我比較聰明，'
      '而是我比其他人努力，我或許不是能輕鬆考上台大的天才，但也不是放任自己未來的蠢才，'
      '正是因為我是轉科生，所以我比別人努力，去彌補那一年的差距。';

  @override
  Widget build(BuildContext context) {

    player.play(AssetSource("Free_Test_Data_1MB_MP3.mp3"));

    return SingleChildScrollView(
      child: Column(
        children:<Widget>[
          //先放個標題
          Padding(padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text("Who am I",
                style: TextStyle(fontSize:24,
                  fontWeight:FontWeight.bold,)),
          ),
          //文字自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [ BoxShadow(color: Colors.amberAccent,
                  offset: Offset(6, 6)),
              ],),
            child:Text(s1,
              style: TextStyle(fontSize: 20),),
          ),

          //放一張照片
          Container(
            color: Colors.redAccent,
            child: Image.asset('images/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30,),

          //一列放兩個圖
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/f1.jpg'),
                    fit: BoxFit.cover ,
                  ),
                  color: Colors.white,
                ),
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.purple,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('images/f2.jpg'),
                    fit: BoxFit.cover ,
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child:Text('學習歷程'),);
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          //有多種排版方式, 此處以最直覺的方式將每一列放文字內容
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text("大一時期"),],
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 200,
                    width: 200,
                  child: ListView(
                    children: [
                      //條列式參考
                      Text('1. 學好英文'),
                      Text('2. 組合語言'),
                      Text('3. 考取證照'),
                      Text('4. 人際關係'),
                    ],
                  ),
                ),
              ],),
          Row(),
          Row(),
          Row(),
          Row(),
          Row(),
          Row(),
        ],
      ),);
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child:Text('專案方向'),);
  }
}
