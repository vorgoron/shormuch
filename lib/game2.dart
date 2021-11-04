import 'package:flutter/material.dart';
import 'package:kyl_shormuch/final_screen.dart';
import 'main.dart';
import 'new_game_screen.dart';

class GameScreen2 extends StatefulWidget {
  int numOfRow = 4;
  List<int> numOfAllLevels = List.of([2, 0, 0, 0]);
  Level currentLevel;
  int currentGameLevel;
  int score = 0;
  int counterOfLevels;
  GameScreen2(List<Level> levels, Level this.currentLevel, int this.currentGameLevel, int this.score,
      {Key key})
      : super(key: key) {
    numOfRow += currentLevel.difficulty;

    print(currentLevel.difficulty);
    currentGameLevel++;
  }

  @override
  _GameScreen2State createState() => _GameScreen2State();


  List<List<List<List<Cell>>>> AllLevels = List.of([
    List.of([
      List.of([
        List.of([Cell(1, "н"), Cell(1, "о"), Cell(2, "ӟ"),Cell(2, "ы"),]),
        List.of([Cell(1, "к"), Cell(1, "и"), Cell(2, "и"), Cell(2, "ч"),]),
        List.of([Cell(3, "о"), Cell(3, "ш"), Cell(4, "р"), Cell(4, "ы")]),
        List.of([Cell(4, "г"), Cell(4, "о"), Cell(4, "н"), Cell(4, "д"),])
      ]), List.of([
        List.of([Cell(1, "к"), Cell(1, "о"), Cell(3, "л"), Cell(3, "о"),]),
        List.of([Cell(1, "к"), Cell(1, "р"),Cell(3, "ы"), Cell(3, "т"),]),
        List.of([Cell(1, "а"), Cell(2, "н"),Cell(2, "о") ,Cell(4, "к") ]),
        List.of([Cell(2, "у"),Cell(2, "к") ,Cell(4, "ӝ") , Cell(4, "ӧ"),])
      ]), List.of([
        List.of([Cell(1, "к"), Cell(3, "б"), Cell(3, "е"), Cell(3, "р"),]),
        List.of([Cell(1, "у"), Cell(2, "у"), Cell(2, "н"), Cell(3, "и"),]),
        List.of([Cell(1, "а"), Cell(2, "ш") , Cell(2, "д"), Cell(3, "з")]),
        List.of([Cell(1, "к"), Cell(1, "а"), Cell(2, "ы"), Cell(3, "ь"),])
      ]),
      //add new words in first level
    ]),

    List.of([
      List.of([
        List.of([Cell(1, "к"), Cell(1, "у"), Cell(1, "ж"),Cell(4, "к"),Cell(4, "у")]),
        List.of([Cell(2, "н"), Cell(2, "я"), Cell(1, "ы"), Cell(4, "з"),Cell(4, "а")]),
        List.of([Cell(2, "ь"), Cell(2, "н"), Cell(1, "м"), Cell(4, "ь"),Cell(5, "р")]),
        List.of([Cell(3, "т"), Cell(3, "ы"), Cell(3, "р"), Cell(5, "г"),Cell(5, "у")]),
        List.of([Cell(3, "ы"), Cell(3, "п"), Cell(3, "т"), Cell(3, "о"),Cell(3, "н")]),
      ])
      //add new words in second level
    ]),

    List.of([
      List.of([
        List.of([Cell(1, "с"), Cell(3, "к"), Cell(3, "ы"),Cell(3, "й"),Cell(3, "о"),Cell(3, "к"),]),
        List.of([Cell(1, "ю"), Cell(4, "и"), Cell(4, "и"), Cell(4, "р"),Cell(6, "н"),Cell(6, "о"),]),
        List.of([Cell(1, "л"), Cell(4, "ч"), Cell(4, "н"), Cell(4, "у"),Cell(4, "д"),Cell(6, "к"),]),
        List.of([Cell(1, "э"), Cell(1, "м"), Cell(7, "у"), Cell(7, "л"),Cell(6, "п"),Cell(6, "у"),]),
        List.of([Cell(2, "у"), Cell(2, "ж"), Cell(7, "о"), Cell(7, "м"),Cell(5, "м"),Cell(5, "е"),]),
        List.of([Cell(2, "п"), Cell(2, "ы"), Cell(2, "м"), Cell(5, "д"),Cell(5, "э"),Cell(5, "р"),]),
      ])
      //add new words in third level
    ]),

    List.of([
      List.of([
        List.of([Cell(1, "в"), Cell(2, "я"), Cell(2, "р"),Cell(2, "а"),Cell(2, "т"),Cell(7, "т"),Cell(5, "в"),]),
        List.of([Cell(1, "е"), Cell(3, "м"), Cell(3, "и"), Cell(2, "н"),Cell(2, "о"),Cell(7, "р"),Cell(5, "ы"),]),
        List.of([Cell(1, "р"), Cell(1, "а"), Cell(3, "н"), Cell(8, "в"),Cell(7, "г"),Cell(7, "у"),Cell(5, "ж"),]),
        List.of([Cell(1, "ь"), Cell(1, "с"), Cell(3, "д"), Cell(8, "а"),Cell(8, "л"),Cell(6, "к"),Cell(5, "ы"),]),
        List.of([Cell(1, "к"), Cell(4, "л"), Cell(3, "э"), Cell(3, "р"),Cell(8, "е" ),Cell(6, "а"),Cell(6, "п"),]),
        List.of([Cell(1, "о"), Cell(4, "у"), Cell(4, "е"), Cell(4, "б"),Cell(8, "с"),Cell(6, "а"),Cell(6, "к"),]),
        List.of([Cell(1, "н"), Cell(4, "л"), Cell(4, "ч"), Cell(4, "е"),Cell(4, "р"),Cell(4, "е"),Cell(4, "т"),]),
      ]),
      //add new words in fourth levels
    ]),
  ]);
  List<List<String>> AllLevelwords = List.of([
    (["кион", "ӟичы", "ош", "гондыр", "корка", "укно", "ӝӧк", "тыло", "куака", "шунды","беризь"]),
    (["кужым", "гур", "куазь", "тыпыртон", "нянь", ]),
    (["сюлэм", "койык", "пужым", "дуринчи", "дэрем", "улмо", "пукон",]),
    (["яратон", "вераськон", "миндэр", "лулчеберет", "валес", "гурт", "капка", "выжы" ])
  ]);
}

class _GameScreen2State extends State<GameScreen2> {
  GlobalKey gridKey = new GlobalKey();
  List<Cell> selectedCells = List.empty(growable: true);
  Map<int, int> wordsLengths = Map();

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
    int counterOfLevels = widget.numOfAllLevels[widget.currentLevel.difficulty];
    wordsLengths.clear();
    return Container(
        child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Android - 9.png"),
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


                            child: Text("Шедьтэм кылъёсыд: ${widget.score} ", style: TextStyle(fontSize: 30, color: Colors.white),),
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
                                                  style:  TextStyle(fontSize: 45, fontWeight: FontWeight.bold),))),
                                          ),
                                        )),
                                  );
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
  void onPressed(){
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              title: Text("Пауза"),
              content: Column(
                children: <Widget>[
                  ElevatedButton(onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                      child: Text("Доре"))
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Потыны'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  void unselectCell(Cell cell) {
    Set<int> wordIds = Set();
    for (var cell in selectedCells) {
      wordIds.add(cell.wordId);
    }
    String word = "";
    selectedCells.forEach((element) {
      word = word + element.letter;
    });
    print("word${word}");
    print("wordIds: $wordIds");
    print("wordsLengths = ${wordsLengths[cell.wordId]}");
    print("selectedCells.length = ${selectedCells.length}");

    if (wordIds.length == 1 && wordsLengths[cell.wordId] == selectedCells.length
        && widget.AllLevelwords[widget.currentLevel.difficulty].contains(word)) {
      // win
      selectedCells.forEach((element) {
        element.isKnown = true;
        element.selected = false;

      });
    }
    else{
      selectedCells.forEach((element) {
        element.isKnown = false;
        element.selected = false;
      });
    }
    if(widget.AllLevelwords[widget.currentLevel.difficulty].contains(word))
      widget.score++;
    print(selectedCells);

    if(widget.AllLevels[widget.currentLevel.difficulty][widget.currentGameLevel]
        .every((element) => element.every((c) => c.isKnown))){
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
      case 3 : return Colors.deepOrange; break;
      case 4 : return Colors.green; break;
      case 5 : return Colors.yellowAccent; break;
      case 6 : return Colors.redAccent; break;
      case 7 : return Colors.deepPurpleAccent; break;
      case 8 : return Colors.lightGreenAccent; break;
      case 9 : return Colors.amberAccent; break;
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
