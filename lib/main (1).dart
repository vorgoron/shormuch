

import 'new_game_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Level {
  Level(this.difficulty, this.levelName, this.sizeOfCell);
  double sizeOfCell;
  int difficulty;
  String levelName;
}

List<Level> levels = List.of([
  Level(0, "Нылпи",70),
  Level(1, "Вожатой",60),
  Level(2, "Ӧнерчи",50),
  Level(3, "Тӧро",40)
]
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кыл Шормуӵ',
      theme: ThemeData(

        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Кыл Шормуӵ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  int currentGameLevel = -1;
  final String title;
  int level;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Level currentLevel = levels.first;
  int score = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background-gray.jpg"),
              fit: BoxFit.cover,
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.settings), onPressed: null),
                  SizedBox(
                    width: 200,
                    height: 30,
                    child: ElevatedButton(onPressed: onPressed,
                          child: Text("Быръелэ уровеньдэс", style: TextStyle(fontSize: 15, color: Colors.white),)),
                  ),

                  IconButton(onPressed: null, icon: Icon(Icons.info_outline))
                ],
              ),
              Container(

                child:  SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameScreen(levels, currentLevel, Level, widget.currentGameLevel, score)),
                    );
                  }, child: Text("Кутскыны", style: TextStyle(fontSize: 25),)
                  ,),
                )

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
            return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                title: Text("Быръелэ уровеньдэс"),
                content: Column(
                  children: <Widget>[
                    for(var level in levels)
                      RadioListTile<Level>(
                        title: Text(level.levelName),
                        value: level,
                        groupValue: currentLevel,
                        onChanged: (value){
                          setState(() {
                            currentLevel = value;
                          });
                        },
                      )
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            );
        });
  }
}



