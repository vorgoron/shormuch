import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyl_shormuch/main.dart';
class FinalScreen extends StatelessWidget {
  int score;
  Level currentLevel;
  FinalScreen( int this.score, Level this.currentLevel, {Key key}) : super(key: key){
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Scaffold(

        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/главный экран.png"),
                fit: BoxFit.cover,
              )
          ),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Шедьтэм кылъёсыд:${score}", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ӟечок!", style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold),),
                        if(currentLevel.difficulty == 3)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(child: Text("${currentLevel.levelName} уровень ортчемын",
                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
                              SizedBox(),
                              SizedBox(
                                width: 400,
                                height: 70,
                                child: ElevatedButton(onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyApp()),
                                  );
                                }, child: Text("Быдэстыны шудонэз",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),),
                                  style: ElevatedButton.styleFrom(primary: Colors.white)),
                              )
                            ],
                          )
                      ],
                    ),

                  ]
              )

          ),
        )
    ));
  }
}
