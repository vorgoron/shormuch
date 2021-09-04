import 'package:flutter/material.dart';
import 'package:kyl_shormuch/game1.dart';
import 'package:kyl_shormuch/game2.dart';

void main() {
  runApp(MyApp());
}

List<Level> levels = List.of([
  Level("Нылпи", 4, 0, 70),
  Level("Вожатой", 5, 1, 60),
  Level("Ӧнерчи", 6, 2, 50),
  Level("Тӧро", 7, 3, 40)
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
  int currentGameLevel = 0;

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
                image: AssetImage("assets/bg_2.jpeg"),
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
                  IconButton(
                      icon: Icon(
                    Icons.settings,
                  )),
                  TextButton(
                      onPressed: onPressed,
                      child: Text(widget.currentLevel.levelName, style: TextStyle(color: Colors.amber),)),
                  IconButton(
                      icon: Icon(
                    Icons.info_outline,
                  )),
                ],
              ),
              Image.asset("launcher.png", width: 150, height: 150),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameScreen(widget.currentLevel.index),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber
                        ),
                        child: Text("'Шормуӵ' шудон")),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GameScreen2(levels, widget.currentLevel, widget.currentGameLevel),
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber
                        ),
                        child: Text("'Шедьты кылэз' шудон")),
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
