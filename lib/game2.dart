import 'package:flutter/material.dart';
import 'package:kyl_shormuch/final_screen.dart';
import 'main.dart';
import 'new_game_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameScreen2 extends StatefulWidget {
  int numOfRow = 3;
  Level currentLevel;
  int currentGameLevel;
  int score = 0;
  int counterOfLevels;
  int counterOfColors = 0;

  GameScreen2(List<Level> levels, Level this.currentLevel, int this.currentGameLevel, int this.score,
      {Key key})
      : super(key: key) {
    numOfRow += currentLevel.difficulty;

    print(currentLevel.difficulty);
    currentGameLevel++;
  }

  @override
  _GameScreen2State createState() => _GameScreen2State();
  List<Color> colorOfScore = ([Colors.white,Colors.lightBlue,
    Colors.orange,Colors.green,Colors.yellowAccent,Colors.redAccent,
    Colors.deepPurpleAccent,Colors.lightGreenAccent
  ]);
  List<String> addWords = List.of([]);
  List<List<List<List<Cell>>>> AllLevels = List.of([
    List.of([
      List.of([
        List.of([Cell(5, "у"), Cell(5, "ж"), Cell(1, "п"),]),
        List.of([Cell(8, "у"), Cell(8, "н"), Cell(1, "у"), ]),
        List.of([Cell(8, "д"), Cell(2, "ы"), Cell(2, "ж"), ]),
      ]),List.of([
        List.of([Cell(8, "ж"), Cell(4, "р"), Cell(2, "ы"),]),
        List.of([Cell(8, "ы"), Cell(4, "а"), Cell(2, "п"), ]),
        List.of([Cell(8, "п"), Cell(2, "т"), Cell(2, "ы"), ]),
      ]),List.of([
        List.of([Cell(6, "д"), Cell(1, "ы"), Cell(1, "ж"),]),
        List.of([Cell(6, "у"), Cell(1, "в"), Cell(9, "к"), ]),
        List.of([Cell(6, "р"), Cell(9, "й"), Cell(9, "ы"), ]),
      ]),List.of([
        List.of([Cell(1, "б"), Cell(3, "ы"), Cell(3, "р"),]),
        List.of([Cell(1, "а"), Cell(3, "н"), Cell(3, "у"), ]),
        List.of([Cell(1, "к"), Cell(1, "а"), Cell(3, "т"), ]),
      ]),
      //add new words in first levels
    ]),
    List.of([
      List.of([
        List.of([Cell(1, "н"), Cell(1, "о"), Cell(2, "ӟ"),Cell(2, "ы"),]),
        List.of([Cell(1, "к"), Cell(1, "и"), Cell(2, "и"), Cell(2, "ч"),]),
        List.of([Cell(3, "о"), Cell(3, "ш"), Cell(4, "р"), Cell(4, "ы")]),
        List.of([Cell(4, "г"), Cell(4, "о"), Cell(4, "н"), Cell(4, "д"),])
      ]), List.of([
        List.of([Cell(1, "к"), Cell(1, "о"), Cell(3, "а"), Cell(3, "р"),]),
        List.of([Cell(1, "к"), Cell(1, "р"),Cell(3, "у"), Cell(3, "к"),]),
        List.of([Cell(1, "а"), Cell(2, "н"),Cell(2, "о") ,Cell(4, "к") ]),
        List.of([Cell(2, "у"),Cell(2, "к") ,Cell(4, "ӝ") , Cell(4, "ӧ"),])
      ]), List.of([
        List.of([Cell(7, "к"), Cell(3, "б"), Cell(3, "е"), Cell(3, "р"),]),
        List.of([Cell(7, "у"), Cell(2, "у"), Cell(2, "н"), Cell(3, "и"),]),
        List.of([Cell(7, "а"), Cell(2, "ш") , Cell(2, "д"), Cell(3, "з")]),
        List.of([Cell(7, "к"), Cell(7, "а"), Cell(2, "ы"), Cell(3, "ь"),])
      ]), List.of([
        List.of([Cell(4, "ч"), Cell(4, "о"), Cell(4, "р"), Cell(4, "ы"),]),
        List.of([Cell(9, "с"), Cell(9, "ь"), Cell(3, "к"), Cell(4, "г"),]),
        List.of([Cell(9, "ю"), Cell(9, "с") , Cell(3, "е"), Cell(3, "ш")]),
        List.of([Cell(9, "к"), Cell(9, "а"), Cell(3, "р"), Cell(3, "ы"),])
      ]),List.of([
        List.of([Cell(1, "с"), Cell(1, "у"), Cell(1, "г"), Cell(6, "н"),]),
        List.of([Cell(8, "к"), Cell(8, "е"), Cell(1, "о"), Cell(6, "ё"),]),
        List.of([Cell(8, "а"), Cell(8, "с") , Cell(1, "н"), Cell(6, "с")]),
        List.of([Cell(8, "м"), Cell(6, "п"), Cell(6, "у"), Cell(6, "к"),])
      ]),List.of([
        List.of([Cell(9, "р"), Cell(9, "ы"), Cell(9, "н"), Cell(7, "п"),]),
        List.of([Cell(1, "а"), Cell(1, "р"), Cell(1, "ъ"), Cell(7, "ы"),]),
        List.of([Cell(7, "н"), Cell(1, "н") , Cell(1, "я"), Cell(7, "ш")]),
        List.of([Cell(7, "ы"), Cell(7, "р"), Cell(7, "у"), Cell(7, "т"),])
      ]),List.of([
        List.of([Cell(3, "й"), Cell(4, "к"), Cell(4, "ы"), Cell(7, "б"),]),
        List.of([Cell(3, "ы"), Cell(4, "а"), Cell(7, "м"), Cell(7, "а"),]),
        List.of([Cell(3, "р"), Cell(4, "р") , Cell(4, "а"), Cell(6, "ь")]),
        List.of([Cell(6, "э"), Cell(6, "м"), Cell(6, "е"), Cell(6, "з"),])
      ]),List.of([
        List.of([Cell(6, "к"), Cell(6, "ы"), Cell(6, "л"), Cell(6, "р"),]),
        List.of([Cell(9, "м"), Cell(3, "л"), Cell(6, "б"), Cell(6, "у"),]),
        List.of([Cell(9, "а"), Cell(3, "а") , Cell(3, "к"), Cell(3, "с")]),
        List.of([Cell(9, "й"), Cell(9, "т"), Cell(9, "а"), Cell(9, "л"),])
      ]),List.of([
        List.of([Cell(4, "л"), Cell(4, "ь"), Cell(4, "ӧ"), Cell(4, "м"),]),
        List.of([Cell(3, "к"), Cell(3, "е"), Cell(3, "т"), Cell(1, "к"),]),
        List.of([Cell(3, "ы"), Cell(3, "ш") , Cell(1, "т"), Cell(1, "у")]),
        List.of([Cell(2, "ы"), Cell(2, "ь"), Cell(2, "з"), Cell(2, "и"),])
      ]),List.of([
        List.of([Cell(4, "н"), Cell(4, "ю"), Cell(4, "л"), Cell(1, "к"),]),
        List.of([Cell(3, "ӵ"), Cell(3, "ӧ"), Cell(4, "э"), Cell(1, "ы"),]),
        List.of([Cell(2, "м"), Cell(3, "ж") , Cell(4, "с"), Cell(1, "з")]),
        List.of([Cell(2, "е"), Cell(2, "ж"), Cell(2, "у"), Cell(2, "г"),])
      ]),List.of([
        List.of([Cell(1, "ч"), Cell(1, "и"), Cell(1, "б"), Cell(3, "ы"),]),
        List.of([Cell(1, "ь"), Cell(1, "н"), Cell(1,"и"), Cell(3, "т"),]),
        List.of([Cell(3, "т"), Cell(3, "у") , Cell(3, "с"), Cell(3, "ь")]),
        List.of([Cell(2, "ь"), Cell(2, "л"), Cell(2, "ӥ"), Cell(2, "с"),])
      ]),
    ]),

    List.of([
      List.of([
        List.of([Cell(8, "в"), Cell(9, "с"), Cell(9, "о"),Cell(9, "р"),Cell(2, "б")]),
        List.of([Cell(8, "о"), Cell(8, "з"), Cell(8, "ь"), Cell(9, "ё"),Cell(2, "а")]),
        List.of([Cell(3, "ӥ"), Cell(3, "н"), Cell(2, "р"), Cell(2, "ы"),Cell(2, "т")]),
        List.of([Cell(3, "д"), Cell(4, "и"), Cell(4, "б"), Cell(4, "ё"),Cell(4, "ӧ")]),
        List.of([Cell(3, "е"), Cell(3, "в"), Cell(4, "у"), Cell(4, "г"),Cell(4, "в")]),
      ]),List.of([
        List.of([Cell(7, "б"), Cell(7, "ч"), Cell(7, "а"),Cell(4, "г"),Cell(4, "у")]),
        List.of([Cell(7, "а"), Cell(7, "к"), Cell(6, "в"), Cell(5, "о"),Cell(4, "д")]),
        List.of([Cell(6, "э"), Cell(6, "т"), Cell(6, "о"), Cell(5, "б"),Cell(4, "ы")]),
        List.of([Cell(6, "с"), Cell(5, "у"), Cell(5, "р"), Cell(5, "о"),Cell(4, "р")]),
        List.of([Cell(1, "ш"), Cell(1, "ы"), Cell(1, "м"), Cell(1, "е"),Cell(4, "и")]),
      ]),List.of([
        List.of([Cell(9, "д"), Cell(9, "ы"), Cell(9, "ш"),Cell(9, "е"),Cell(9, "т")]),
        List.of([Cell(7, "д"), Cell(7, "л"), Cell(7, "ӧ"), Cell(9, "к"),Cell(9, "с")]),
        List.of([Cell(7, "э"), Cell(2, "ь"), Cell(7, "в"), Cell(9, "о"),Cell(4, "а")]),
        List.of([Cell(7, "т"), Cell(2, "н"), Cell(4, "и"), Cell(9, "н"),Cell(4, "р")]),
        List.of([Cell(2, "в"), Cell(2, "е"), Cell(4, "р"), Cell(4, "е"),Cell(4, "б")]),
      ]),List.of([
        List.of([Cell(2, "ч"), Cell(2, "у"), Cell(7, "у"),Cell(7, "й"),Cell(7, "в")]),
        List.of([Cell(2, "и"), Cell(2, "к"), Cell(5, "л"), Cell(9, "к"),Cell(7, "ӧ")]),
        List.of([Cell(2, "н"), Cell(5, "п"), Cell(5, "а"), Cell(9, "о"),Cell(7, "т")]),
        List.of([Cell(2, "д"), Cell(5, "а"), Cell(5, "с"), Cell(9, "ӵ"),Cell(9, "ы")]),
        List.of([Cell(2, "э"), Cell(2, "р"), Cell(3, "с"), Cell(3, "ӧ"),Cell(9, "ш")]),
      ]),List.of([
        List.of([Cell(1, "а"), Cell(1, "д"), Cell(1, "я"),Cell(6, "в"),Cell(6, "а")]),
        List.of([Cell(8, "у"), Cell(8, "д"), Cell(1, "м"), Cell(1, "и"),Cell(6, "м")]),
        List.of([Cell(8, "ш"), Cell(8, "е"), Cell(8, "с"), Cell(5, "с"),Cell(6, "ы")]),
        List.of([Cell(5, "г"), Cell(5, "е"), Cell(5, "р"), Cell(5, "э"),Cell(6, "ш")]),
        List.of([Cell(2, "э"), Cell(2, "к"), Cell(2, "с"), Cell(2, "э"),Cell(2, "й")]),
      ]),List.of([
        List.of([Cell(9, "в"), Cell(9, "и"), Cell(9, "р"),Cell(9, "н"),Cell(6, "т")]),
        List.of([Cell(2, "г"), Cell(9, "а"), Cell(9, "н"), Cell(9, "у"),Cell(6, "а")]),
        List.of([Cell(2, "о"), Cell(9, "л"), Cell(2, "м"), Cell(2, "а"),Cell(6, "ш")]),
        List.of([Cell(2, "р"), Cell(2, "у"), Cell(2, "ш"), Cell(2, "н"),Cell(6, "б")]),
        List.of([Cell(2, "д"), Cell(2, "к"), Cell(6, "а"), Cell(6, "к"),Cell(6, "а")]),
      ]),List.of([
        List.of([Cell(9, "л"), Cell(9, "ы"), Cell(9, "м"),Cell(3, "ю"),Cell(3, "с")]),
        List.of([Cell(2, "к"), Cell(3, "л"), Cell(9, "ы"), Cell(3, "с"),Cell(1, "й")]),
        List.of([Cell(2, "у"), Cell(3, "ы"), Cell(3, "т"), Cell(3, "ь"),Cell(1, "ӧ")]),
        List.of([Cell(2, "р"), Cell(2, "е"), Cell(2, "г"), Cell(7, "к"),Cell(7, "ы")]),
        List.of([Cell(7, "в"), Cell(7, "ы"), Cell(7, "ж"), Cell(7, "ы"),Cell(7, "л")]),
      ]),List.of([
        List.of([Cell(9, "т"), Cell(1, "а"), Cell(1, "т"),Cell(1, "а"),Cell(6, "ы")]),
        List.of([Cell(9, "э"), Cell(4, "б"), Cell(4, "ӧ"), Cell(1, "с"),Cell(6, "р")]),
        List.of([Cell(9, "л"), Cell(9, "ь"), Cell(4, "д"), Cell(6, "д"),Cell(6, "у")]),
        List.of([Cell(7, "о"), Cell(7, "р"), Cell(4, "ё"), Cell(4, "н"),Cell(4, "о")]),
        List.of([Cell(7, "з"), Cell(7, "к"), Cell(7, "и"), Cell(7, "б"),Cell(7, "ы")]),
      ]),List.of([
        List.of([Cell(9, "б"), Cell(8, "т"), Cell(8, "ы"),Cell(8, "м"),Cell(8, "е")]),
        List.of([Cell(9, "у"), Cell(1, "ы"), Cell(1, "з"), Cell(1, "у"),Cell(8, "т")]),
        List.of([Cell(9, "б"), Cell(9, "ы"), Cell(9, "л"), Cell(9, "и"),Cell(7, "л")]),
        List.of([Cell(7, "й"), Cell(7, "э"), Cell(7, "т"), Cell(7, "м"),Cell(7, "е")]),
        List.of([Cell(6, "а"), Cell(6, "й"), Cell(6, "ш"), Cell(6, "е"),Cell(6, "т")]),
      ]),List.of([
        List.of([Cell(1, "ӟ"), Cell(1, "о"), Cell(1, "л"),Cell(1, "ь"),Cell(7, "н")]),
        List.of([Cell(5, "л"), Cell(1, "р"), Cell(1, "ы"), Cell(1, "г"),Cell(7, "у")]),
        List.of([Cell(5, "ы"), Cell(1, "и"), Cell(8, "ь"), Cell(4, "ӵ"),Cell(7, "м")]),
        List.of([Cell(5, "ь"), Cell(8, "ю"), Cell(8, "с"), Cell(4, "ы"),Cell(7, "ы")]),
        List.of([Cell(5, "з"), Cell(5, "ӥ"), Cell(5, "с"), Cell(4, "н"),Cell(7, "р")]),
      ]),List.of([
        List.of([Cell(1, "к"), Cell(1, "у"), Cell(1, "ж"),Cell(4, "к"),Cell(4, "у")]),
        List.of([Cell(2, "н"), Cell(2, "я"), Cell(1, "ы"), Cell(4, "з"),Cell(4, "а")]),
        List.of([Cell(2, "ь"), Cell(2, "н"), Cell(1, "м"), Cell(4, "ь"),Cell(5, "р")]),
        List.of([Cell(3, "т"), Cell(3, "ы"), Cell(3, "р"), Cell(5, "г"),Cell(5, "у")]),
        List.of([Cell(3, "ы"), Cell(3, "п"), Cell(3, "т"), Cell(3, "о"),Cell(3, "н")]),
      ]),List.of([
        List.of([Cell(6, "э"), Cell(6, "б"), Cell(4, "п"),Cell(4, "ӧ"),Cell(4, "с")]),
        List.of([Cell(3, "ы"), Cell(6, "е"), Cell(4, "э"), Cell(4, "т"),Cell(4, "я")]),
        List.of([Cell(3, "ч"), Cell(6, "к"), Cell(4, "м"), Cell(2, "т"),Cell(2, "ы")]),
        List.of([Cell(3, "т"), Cell(2, "к"), Cell(2, "ы"), Cell(2, "с"),Cell(2, "б")]),
        List.of([Cell(3, "р"), Cell(3, "я"), Cell(3, "с"), Cell(2, "й"),Cell(2, "е")]),
      ]),List.of([
        List.of([Cell(1, "ш"), Cell(1, "ы"), Cell(1, "д"),Cell(6, "в"),Cell(6, "у")]),
        List.of([Cell(3, "п"), Cell(2, "ы"), Cell(2, "м"), Cell(2, "е"),Cell(2, "с")]),
        List.of([Cell(3, "е"), Cell(2, "к"), Cell(3, "я"), Cell(3, "н"),Cell(4, "в")]),
        List.of([Cell(3, "л"), Cell(3, "ь"), Cell(3, "н"), Cell(3, "ь"),Cell(4, "а")]),
        List.of([Cell(5, "и"), Cell(5, "б"), Cell(5, "у"), Cell(5, "г"),Cell(4, "л")]),
      ]),List.of([
        List.of([Cell(1, "ч"), Cell(1, "и"), Cell(1, "н"),Cell(3, "б"),Cell(3, "ы")]),
        List.of([Cell(2, "п"), Cell(1, "ы"), Cell(1, "ь"), Cell(3, "о"),Cell(3, "р")]),
        List.of([Cell(2, "а"), Cell(2, "л"), Cell(2, "э"), Cell(2, "з"),Cell(2, "ь")]),
        List.of([Cell(5, "б"), Cell(5, "я"), Cell(5, "р"), Cell(4, "л"),Cell(4, "ы")]),
        List.of([Cell(5, "а"), Cell(5, "д"), Cell(4, "т"), Cell(4, "у"),Cell(4, "с")]),
      ]),

    ]),

    List.of([
      List.of([
        List.of([Cell(5, "а"), Cell(8, "в"), Cell(8, "е"),Cell(8, "к"),Cell(8, "о"),Cell(8, "н"),]),
        List.of([Cell(5, "р"), Cell(5, "а"), Cell(8, "р"), Cell(8, "ь"),Cell(6, "о"),Cell(6, "г"),]),
        List.of([Cell(5, "а"), Cell(5, "м"), Cell(8, "а"), Cell(8, "с"),Cell(6, "н"),Cell(6, "р"),]),
        List.of([Cell(2, "к"), Cell(7, "р"), Cell(7, "ӧ"), Cell(7, "ь"),Cell(7, "с"),Cell(6, "ы"),]),
        List.of([Cell(2, "у"), Cell(2, "а"), Cell(2, "н"), Cell(7, "и"),Cell(7, "н"),Cell(3, "ы"),]),
        List.of([Cell(2, "ш"), Cell(2, "м"), Cell(3, "г"), Cell(3, "ы"),Cell(3, "р"),Cell(3, "л"),]),
      ]),List.of([
        List.of([Cell(1, "я"), Cell(1, "р"), Cell(5, "т"),Cell(5, "е"),Cell(5, "р"),Cell(5, "е"),]),
        List.of([Cell(2, "к"), Cell(1, "а"), Cell(1, "т"), Cell(1, "о"),Cell(1, "н"),Cell(5, "б"),]),
        List.of([Cell(2, "а"), Cell(2, "а"), Cell(5, "у"), Cell(5, "л"),Cell(5, "ч"),Cell(5, "е"),]),
        List.of([Cell(2, "п"), Cell(2, "к"), Cell(5, "л"), Cell(4, "г"),Cell(4, "у"),Cell(4, "р"),]),
        List.of([Cell(9, "р"), Cell(9, "э"), Cell(9, "д"), Cell(3, "е"),Cell(3, "л"),Cell(4, "т"),]),
        List.of([Cell(9, "м"), Cell(9, "и"), Cell(9, "н"), Cell(3, "с"),Cell(3, "а"),Cell(3, "в"),]),
      ]),List.of([
        List.of([Cell(9, "в"), Cell(9, "а"), Cell(9, "р"),Cell(3, "г"),Cell(3, "а"),Cell(3, "ж"),]),
        List.of([Cell(9, "у"), Cell(9, "к"), Cell(9, "н"), Cell(4, "г"),Cell(3, "н"),Cell(3, "а"),]),
        List.of([Cell(2, "г"), Cell(8, "г"), Cell(9, "а"), Cell(4, "о"),Cell(4, "р"),Cell(4, "д"),]),
        List.of([Cell(2, "е"), Cell(8, "у"), Cell(9, "н"), Cell(8, "р"),Cell(6, "л"),Cell(4, "с"),]),
        List.of([Cell(2, "р"), Cell(8, "ж"), Cell(8, "д"), Cell(8, "о"),Cell(6, "я"),Cell(4, "ю"),]),
        List.of([Cell(2, "ы"), Cell(6, "ӵ"), Cell(6, "у"), Cell(6, "ш"),Cell(6, "ъ"),Cell(4, "й"),]),
      ]),List.of([
        List.of([Cell(1, "с"), Cell(3, "к"), Cell(3, "ы"),Cell(3, "й"),Cell(3, "о"),Cell(3, "к"),]),
        List.of([Cell(1, "ю"), Cell(4, "и"), Cell(4, "и"), Cell(4, "р"),Cell(6, "н"),Cell(6, "о"),]),
        List.of([Cell(1, "л"), Cell(4, "ч"), Cell(4, "н"), Cell(4, "у"),Cell(4, "д"),Cell(6, "к"),]),
        List.of([Cell(1, "э"), Cell(1, "м"), Cell(7, "у"), Cell(7, "л"),Cell(6, "п"),Cell(6, "у"),]),
        List.of([Cell(2, "у"), Cell(2, "ж"), Cell(7, "о"), Cell(7, "м"),Cell(5, "м"),Cell(5, "е"),]),
        List.of([Cell(2, "п"), Cell(2, "ы"), Cell(2, "м"), Cell(5, "д"),Cell(5, "э"),Cell(5, "р"),]),
      ]),
      //add new words in third level
    ]),


  ]);
  List<String> AllLevelwords = List.of([
    "ыж","уж","дун","пу",
    "пыж","ар","тыпы",
    "выж","кый","дур",
    "турын","бака",
    "кион", "ӟичы", "ош", "гондыр",
    "корка", "укно", "ӝӧк", "куар",
    "куака", "шунды","беризь",
    "чорыг","сюкась","кешыр",
    "сугон","пуксён","макес",
    "йыр","бам","эмезь","аракы",
    "аръян","пыштурын","ныр",
    "кылбур","майтал","скал",
    "льӧм","изьы","кут","кышет",
    "нюлэс","ӵӧж","гужем","кыз",
    "чибинь","сӥль","тусьты",
    "кужым", "гур", "куазь", "тыпыртон", "нянь",
    "эбек","пӧсятэм","кыстыбей","сяртчы",
    "шыд","ву","пельнянь","вал","губи","кымес",
    "чиньы","боры","бадяр","тулыс","палэзь",
    "ӟольгыри","юсь","нумыр","ӵын","сӥзьыл",
    "бубыли","тымет","лемтэй","айшет","узы",
    "тэль","зоркибы","дуры","атас","бӧдёно",
    "сюсьтыл","выжыкыл","лымы","йӧ","курег",
    "вирнунал","ташбака","гордкушман",
    "адями","эксэй","сэрег","душес","вамыш",
    "чукиндэр","уйвӧт","коӵыш","ӧс","лапас",
    "дышетскон","арбери","вӧлдэт","вень",
    "бакча","гудыри","емыш","вотэс","уробо",
    "ӝуй","ёрос","батыр","вӧёгуби","ведӥн","возь",
    "сюлэм", "койык", "пужым", "дуринчи", "дэрем", "улмо", "пукон",
    "геры","вукарнан","гажан","гуждор","ӵушъял","гордсюй","гуждор",
    "гырлы","инсьӧр",

    "яратон", "вераськон", "миндэр", "лулчеберет", "валес", "гурт", "капка", "выжы",
    "арама","кыл","тусь","дыр","уй","вӧт","уд","вир","нунал","уксё",
    "кушман","шур","лым","ым","ты","лы","лыс","тыл","ур",
    "сюсь","зор","кибы","тэй","гу","гумы","гырлы","муг",
    "ку","куа","куак","гон","ыргон","пель","бун",
    "пал","ин","тус","сюл","пуж","пужы","пум","куды","кар","ки","сюй","дор",
  ]);
}

class _GameScreen2State extends State<GameScreen2> {
  GlobalKey gridKey = new GlobalKey();
  List<Cell> selectedCells = List.empty(growable: true);
  Map<int, int> wordsLengths = Map();
  String word = "";

  void selectItem(GlobalKey<State<StatefulWidget>> gridItemKey, var details) {
    RenderBox _boxItem = gridItemKey.currentContext.findRenderObject();
    RenderBox _boxMainGrid = gridKey.currentContext.findRenderObject();
    Offset position = _boxMainGrid.localToGlobal(Offset.zero); //this is global position
    double gridLeft = position.dx;
    double gridTop = position.dy;

    double gridPosition = details.globalPosition.dy - gridTop;

    //Get item position
    int rowIndex = (gridPosition / _boxItem.size.width).floor().toInt();
    int colIndex = ((details.globalPosition.dx - gridLeft) / _boxItem.size.width).floor().toInt();
    var matrix = widget.AllLevels[widget.currentLevel.difficulty][widget.currentGameLevel];
    var cell = matrix[rowIndex][colIndex];
    if (!selectedCells.contains(cell)) {
      if(!cell.isKnown){
        cell.selected = true;
        selectedCells.add(cell);
      }
    }

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    List<int> numOfAllLevels = List.of([widget.AllLevels[0].length-1,
      widget.AllLevels[1].length-1,
      widget.AllLevels[2].length-1,
      widget.AllLevels[3].length-1]);
      widget.counterOfLevels = numOfAllLevels[widget.currentLevel.difficulty];

    wordsLengths.clear();
    return Container(
        child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.currentLevel.fon),
                    fit: BoxFit.cover,
                  )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: AnimatedDefaultTextStyle(
                          duration: Duration(microseconds: 1),
                          style: TextStyle(),
                          child: Text("Шедьтэм кылъёсыд: ${widget.score} ",
                            style: TextStyle(fontSize: 30, color: widget.colorOfScore[widget.counterOfColors]),),
                        ),
                      ),
                    ),
                    // IconButton(onPressed: onPressed, icon: Icon(Icons.pause_circle_outline, size: 50,color: Colors.pink,)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      ],
                    ),
                    Center(
                      child: Container(
                        key: gridKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < widget.numOfRow; i++)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(widget.numOfRow, (j) {
                                  GlobalKey gridItemKey = new GlobalKey();
                                  var matrix = widget.AllLevels[widget.currentLevel.difficulty][
                                  widget.currentGameLevel];
                                  var cell = matrix[i][j];
                                  wordsLengths.putIfAbsent(cell.wordId, () => 0);
                                  wordsLengths[cell.wordId]++;
                                  return AbsorbPointer(
                                      absorbing: cell.isKnown ,
                                      child: GestureDetector(
                                        onTapDown: (details) {
                                          selectItem(gridItemKey, details);
                                        },
                                        onTapUp: (details) {
                                          unselectCell(cell);
                                        },
                                        onPanUpdate: (details) {
                                          selectItem(gridItemKey, details);
                                        },
                                        onPanEnd: (details) {
                                          unselectCell(cell);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.5),
                                          child: Container(
                                              color: cell.isKnown ?
                                              getColor(cell) :
                                              cell.selected ? Colors.grey: Colors.white,
                                              child: SizedBox(
                                                  key: gridItemKey,
                                                  width: widget.currentLevel.sizeOfCell,
                                                  height: widget.currentLevel.sizeOfCell,
                                                  child: Center(child: Text(cell.letter,
                                                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                                                  ),
                                                  ))),
                                        ),
                                      ));

                                }),
                              ),

                          ],

                        ),

                      ),
                    ),
                    Text("", style: TextStyle(fontSize: 40, color: Colors.pink),),
                    SizedBox()
                  ],
                ),
              ),
            )));

  }
  // void onPressed(){
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return StatefulBuilder(
  //           builder: (context, setState) => AlertDialog(
  //             title: Text("Пауза"),
  //             content: Column(
  //               children: <Widget>[
  //                 ElevatedButton(onPressed:(){
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => MyApp()),
  //                   );
  //                 },
  //                     child: Text("Доре"))
  //               ],
  //             ),
  //             actions: <Widget>[
  //               TextButton(
  //                 child: Text('Потыны'),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }

  void unselectCell(Cell cell) {
    Set<int> wordIds = Set();
    for (var cell in selectedCells) {
      wordIds.add(cell.wordId);
    }
    String lastWord = word;

    word = "";
    selectedCells.forEach((element) {
      word = word + element.letter;
    });
    print("last $lastWord");
    print(word);
    if(widget.counterOfColors > 6){
      widget.counterOfColors = 0;
    }
    if (wordIds.length == 1 && wordsLengths[cell.wordId] == selectedCells.length
        && widget.AllLevelwords.contains(word)) {
      // win
      selectedCells.forEach((element) {
        element.isKnown = true;
        element.selected = false;

      });
    }
    else {
      selectedCells.forEach((element) {
        element.isKnown = false;
        element.selected = false;
      });
    }
    if (widget.addWords.contains(word) && cell.isKnown == false ) {
      showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(

                content: Text("Тон та кылэз шедьтӥд ни ук)"),
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
    else if(lastWord == word && cell.isKnown == false
        && widget.AllLevelwords.contains(word) == false){
      showDialog(
          context: context,
          builder: (context) {
            return StatefulBuilder(builder: (context, setState) {
              return AlertDialog(
                content: Text("Мон та кылэз уг тодӥськы"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("ОК")),
                ],
              );
            });
          });
    }
    if (widget.AllLevelwords.contains(word)
        && widget.addWords.contains(word) == false ){
      widget.score++;
      widget.counterOfColors++;
    }
    if(widget.AllLevelwords.contains(word) && cell.isKnown == false){
      widget.addWords.add(word);
    }
    if(widget.AllLevels[widget.currentLevel.difficulty][widget.currentGameLevel]
        .every((element) => element.every((c) => c.isKnown))){
      savedVariables();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewGame(levels,
            widget.currentLevel,
            Level,
            widget.currentGameLevel,
            widget.AllLevels, widget.score)),
      );
    }

    selectedCells.clear();
    setState(() {});
  }
  Color getColor (Cell cell){
    switch(cell.wordId){
      case 1 : return Colors.purpleAccent; break;
      case 2 : return Colors.lightBlue; break;
      case 3 : return Colors.orange; break;
      case 4 : return Colors.green; break;
      case 5 : return Colors.yellowAccent; break;
      case 6 : return Colors.redAccent; break;
      case 7 : return Colors.deepPurpleAccent; break;
      case 8 : return Colors.lightGreenAccent; break;
      case 9 : return Colors.brown; break;
    }
  }
  void savedVariables() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(widget.currentGameLevel == widget.counterOfLevels){
      prefs.setInt("currentGameLevel", -1);
      switch (widget.currentLevel.difficulty) {
        case 0:
          prefs.setInt("currentDifficult", 1);
          prefs.setDouble("currentSizeOfCell", 75);
          prefs.setString("levelName", "Вожатой");
          prefs.setString("fonOfLevel", "fon2.png");
          break;
        case 1:
          prefs.setInt("currentDifficult", 2);
          prefs.setDouble("currentSizeOfCell", 65);
          prefs.setString("levelName", "Ӧнерчи");
          prefs.setString("fonOfLevel", "fon3.png");
          break;
        case 2:
          prefs.setInt("currentDifficult", 3);
          prefs.setDouble("currentSizeOfCell", 55);
          prefs.setString("levelName", "Тӧро");
          prefs.setString("fonOfLevel", "fon4.png");
          break;
        case 3:
          prefs.setInt("currentDifficult", 0);
          prefs.setDouble("currentSizeOfCell", 85);
          prefs.setString("levelName", "Нылпи");
          prefs.setString("fonOfLevel", "fon1.png");
          prefs.setInt("score", 0);
          break;
      }
    }
    else {
      prefs.setInt("currentGameLevel", widget.currentGameLevel);
      prefs.setInt("score", widget.score);
      prefs.setInt("currentDifficult", widget.currentLevel.difficulty);
      prefs.setDouble("currentSizeOfCell", widget.currentLevel.sizeOfCell);
      prefs.setString("levelName", widget.currentLevel.levelName);
      prefs.setString("fonOfLevel", widget.currentLevel.fon);
    }
  }
}
class Cell {
  Cell(this.wordId, this.letter);
  String letter;
  int wordId;
  bool selected = false;
  bool isKnown = false;
}