import 'package:flutter/material.dart';
import 'package:kyl_shormuch/game1.dart';
import 'package:kyl_shormuch/game2.dart';

void main() {
  runApp(MyApp());
}

List<Level> levels = List.of([
  Level("Нылпи", 0, 0, 75),
  Level("Вожатой", 1, 1, 65),
  Level("Ӧнерчи", 2, 2, 55),
  Level("Тӧро", 3, 3, 45)
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
  Level(this.levelName, this.difficulty, this.index, this.sizeOfCell);

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
                image: AssetImage("assets/Чорыгъёс.png"),
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
                          child: Text(widget.currentLevel.levelName, style: TextStyle(color: Colors.white),)),
                    ),
                  ),
                  SizedBox()
                ],
              ),
              Image.asset("launcher.png", width: 150, height: 150),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 270,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameScreen1(widget.currentLevel.index),
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameScreen2(levels, widget.currentLevel, widget.currentGameLevel, widget.score),
                          ));
                        },
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

  void onPressed() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
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
            );
          });
        });
  }
}
