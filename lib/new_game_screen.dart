import 'package:flutter/material.dart';
import 'package:kyl_shormuch/final_screen.dart';
import 'game2.dart';
import 'main.dart';
class NewGame extends StatelessWidget {
  List<int> numOfAllLevels = List.of([2, 0, 0, 0]);
  Level currentLevel;
  int currentGameLevel;
  List<List<List<List<Cell>>>> AllLevels;
  int score;
  NewGame(List<Level> levels,  Level this.currentLevel, Level, int this.currentGameLevel, List<List<List<List<Cell>>>> this.AllLevels, int this.score, {Key key}) : super(key: key){
  }
  List<String> congrates = ([
    "Ӟеч уж", "Тон ӟечок", "ӟечкыласько", "Умой ужад"
  ]);

  @override
  Widget build(BuildContext context) {
    int counterOfLevels = numOfAllLevels[currentLevel.difficulty];
    print(currentGameLevel);
    return Container(
        child: Scaffold(
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
                        SizedBox(),
                        ElevatedButton(onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                            child: Text("Доре")),
                        Text("Шедьтэм кылъёсыд: ${score}", style: TextStyle(fontSize: 30),),
                        Text("Ӟечок", style: TextStyle(fontSize: 50)),
                        if(currentGameLevel == counterOfLevels)
                          ElevatedButton(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  FinalScreen(score, currentLevel)),
                            );
                          }, child: Text("Шудон быриз")),
                        if(currentGameLevel < counterOfLevels)
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    GameScreen2(levels, currentLevel, currentGameLevel, score)),
                              );
                            }, child: Text("Азьлань")),
                          ),
                        SizedBox()
                      ]
                  )

              ),
            )
        )
    );
  }
}
