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
                image: AssetImage("assets/background-gray.jpg"),
                fit: BoxFit.cover,
              )
          ),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Text("Шедьтэм кылъёсыд: ${score}", style: TextStyle(fontSize: 30),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Ӟечок!", style: TextStyle(fontSize: 40),),
                        Center(child: Text("${currentLevel.levelName} уровень ортчемын", style: TextStyle(fontSize: 25)))
                      ],
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      }, child: Text("Доре")),
                    )
                  ]
              )

          ),
        )
    ));
  }
}
