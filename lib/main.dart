import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyl_shormuch/game1.dart';
import 'package:kyl_shormuch/game2.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());

}

List<Level> levels = List.of([
  Level("fon1.png","Нылпи", 0, 0, 85),
  Level("fon2.png","Вожатой", 1, 1, 75),
  Level("fon3.png","Ӧнерчи", 2, 2, 65),
  Level("fon4.png","Тӧро", 3, 3, 55)
]);

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Кыл Шормуӵ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Кыл Шормуӵ'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  Level currentLevel = levels.first;
  int currentGameLevel = -1;
  int score = 0;

  @override

  _MyHomePageState createState() => _MyHomePageState();

}

class Level {
  Level(this.fon ,this.levelName, this.difficulty, this.index, this.sizeOfCell);
  String fon;
  String levelName;
  int difficulty;
  int index;
  double sizeOfCell;
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/главный экран (1).png"),
                fit: BoxFit.cover
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.lightBlue),
                          onPressed: onPressed,
                          child: AnimatedDefaultTextStyle(duration: Duration(microseconds: 1),
                          style: TextStyle(color: Colors.white),
                          child: Text("Уровень",
                            style: TextStyle(color: Colors.white),))),
                    ),
                  ), // лвлъёс милям по-порядку мыно соин не вижу смысла та кнопкаын кытын уровнез быгатиськом воштыны,

                  SizedBox()
                ],
              ),
              SizedBox(),
              SizedBox(),SizedBox(),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 270,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                GameScreen1(widget.currentLevel.index),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: Text("'Шормуӵ' шудон",
                          style: TextStyle(fontSize: 20, color: Colors.white),)),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 50,
                    width: 270,
                    child: ElevatedButton(
                        onPressed: getVariables,
                        style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: Text("'Шедьты кылэз' шудон",
                            style: TextStyle(fontSize: 20, color: Colors.white))),
                  ),
                ],
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
  void getVariables() async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      widget.score = prefs.getInt("score");
      if(widget.score == null){
        widget.currentLevel.difficulty = 0;
        widget.currentLevel.levelName = "Нылпи";
        widget.currentLevel.sizeOfCell = 85;
        widget.currentGameLevel = -1;
        widget.score = 0;
        widget.currentLevel.fon = "fon1.png";
      }
      else{
        widget.currentLevel.fon = prefs.getString("fonOfLevel");
        widget.currentGameLevel = prefs.getInt("currentGameLevel");
        widget.score = prefs.getInt("score");
        widget.currentLevel.difficulty = prefs.getInt("currentDifficult");
        widget.currentLevel.levelName = prefs.getString("levelName");
        widget.currentLevel.sizeOfCell = prefs.getDouble("currentSizeOfCell");
      }
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => GameScreen2(levels, widget.currentLevel,
            widget.currentGameLevel, widget.score),
      ));
  }
  void changeScreen(){

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => GameScreen2(levels, widget.currentLevel,
          widget.currentGameLevel, widget.score),
    ));

  }
  void onPressed() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return FittedBox(
              child: AlertDialog(
                title: Text('Быръелэ уровеньдэс'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (var level in levels)
                      RadioListTile<Level>(
                          title: Text(level.levelName),
                          value: level,
                          groupValue: widget.currentLevel,
                          onChanged: (value) {
                            setState(() {
                              widget.currentLevel = value;
                            });
                          })
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("ОК"))
                ],
              ),
            );
          });
        });
  }
}