import 'package:flutter/material.dart';
import 'package:kyl_shormuch/final_screen.dart';
import 'game2.dart';
import 'main.dart';
class NewGame extends StatelessWidget {

  Level currentLevel;
  int currentGameLevel;
  List<List<List<List<Cell>>>> AllLevels;
  int score;
  NewGame(List<Level> levels,  Level this.currentLevel, Level,
      int this.currentGameLevel, List<List<List<List<Cell>>>> this.AllLevels, int this.score, {Key key}) : super(key: key){
  }

  @override
  Widget build(BuildContext context) {
    List<int> numOfAllLevels = List.of([AllLevels[0].length-1,
      AllLevels[1].length-1,
      AllLevels[2].length-1,
      AllLevels[3].length-1]);
    int counterOfLevels = numOfAllLevels[currentLevel.difficulty];
    print(currentGameLevel);
    return Container(
        child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/главный экран.png"),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(),
                        // ElevatedButton(onPressed:(){
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => MyApp()),
                        //   );
                        // },
                        //     child: Text("Доре")),
                        Text("Шедьтэм кылъёсыд: ${score}", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                        Text("Ӟечок", style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold)),

                        if(currentGameLevel == counterOfLevels && currentLevel.difficulty == 3)
                          SizedBox(
                            width: 300,
                            height: 70,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    FinalScreen(score, currentLevel)),
                              );
                            }, child: Text("Азьлань", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),)
                              ,style: ElevatedButton.styleFrom(primary: Colors.white),),
                          ),
                        if(currentGameLevel == counterOfLevels && currentLevel.difficulty != 3)
                            Text('"${currentLevel.levelName}" уровень ортчемын',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                        if(currentGameLevel == counterOfLevels && currentLevel.difficulty != 3)
                          SizedBox(
                            width: 300,
                            height: 70,
                            child: ElevatedButton(onPressed: (){
                              switch(currentLevel.difficulty) {
                                case 0: currentLevel = levels[1];
                                break;
                                case 1: currentLevel = levels[2];
                                break;
                                case 2: currentLevel = levels[3];
                                break;
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    GameScreen2(levels, currentLevel, currentGameLevel = -1, score)),
                              );
                            }, child: Text("Вуоно уровень", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),)
                              ,style: ElevatedButton.styleFrom(primary: Colors.white),),

                          ),
                        if(currentGameLevel < counterOfLevels)
                          SizedBox(
                            width: 300,
                            height: 70,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    GameScreen2(levels, currentLevel, currentGameLevel, score)),
                              );
                            }, child: Text("Азьлань", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),)
                              ,style: ElevatedButton.styleFrom(primary: Colors.white),),
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
