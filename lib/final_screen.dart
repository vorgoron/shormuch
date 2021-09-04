import 'package:flutter/material.dart';
class FinalScreen extends StatelessWidget {
  const FinalScreen({Key  key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                      height: 30,
                      width: 200,
                      child: Text("score")),
                  Text("ӟечок"),
                ]
            )

        )
    ));
  }
}
