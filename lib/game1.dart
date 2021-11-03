import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyl_shormuch/words.dart';

class Cell {
  Cell(this.wordIndex, this.letter);

  int wordIndex;
  String letter;
  bool selected = false;
  int i = -1;
  int j = -1;

  @override
  String toString() {
    return "cell '$letter', s=$selected";
  }
}

class GameScreen1 extends StatefulWidget {
  GameScreen1(this.levelIndex, {Key key}) : super(key: key);
  int levelIndex;

  @override
  _GameScreen1State createState() => _GameScreen1State();
}

class _GameScreen1State extends State<GameScreen1> {
  Map<int, List<Cell>> wordsMap = Map();
  GlobalKey gridKey = new GlobalKey();
  List<Cell> selectedCells = List.empty(growable: true);
  var currentSubjectIndex = 0;
  List<Subject> subjs;
  List<List<Cell>> matrix;
  var showStartDialog = true;

  void nextGame() {
    currentSubjectIndex++;
    var subject = subjs[currentSubjectIndex];
    matrix = generateMatrix(subject.words);
    wordsMap.clear();
    for (var col in matrix) {
      col.forEach((cell) {
        wordsMap.putIfAbsent(cell.wordIndex, () => List.empty(growable: true));
        wordsMap[cell.wordIndex].add(cell);
      });
    };
    showStartGameDialog(subject);
    setState(() {});
  }

  @override
  void initState() {
    subjs = Const.gameSubjects.where((element) => element.level == widget.levelIndex).toList();
    var subject = subjs[currentSubjectIndex];
    matrix = generateMatrix(subject.words);
    for (var col in matrix) {
      col.forEach((cell) {
        wordsMap.putIfAbsent(cell.wordIndex, () => List.empty(growable: true));
        wordsMap[cell.wordIndex].add(cell);
      });
    };

    super.initState();
  }

  // Future<void> loadSound() async {
  //   int soundId = await rootBundle.load("bubble.wav").then((ByteData soundData) {
  //     return pool.load(soundData);
  //   });
  //   await pool.play(soundId);
  // }

  void showStartGameDialog(Subject subject) {
    showDialog(context: context, builder: (context) =>
      AlertDialog(
        title: Text("Мае утчано"),
        content: Text(subject.name),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ярам"))
        ],
      ));
  }

  @override
  Widget build(BuildContext context) {
    // if (showStartDialog) {
    //   showStartGameDialog(subjs[currentSubjectIndex]);
    //   showStartDialog = false;
    // }
    var maxColumnLength = 0;

    void selectItem(GlobalKey<State<StatefulWidget>> gridItemKey, Offset offset) {

      RenderBox _box = gridItemKey.currentContext.findRenderObject();
      RenderBox _boxGrid = gridKey.currentContext.findRenderObject();
      Offset position = _boxGrid.localToGlobal(Offset.zero); //this is global position
      double gridLeft = position.dx;
      double gridTop = position.dy;

      double gridPosition = offset.dy - gridTop;

      // Get item position
      int rowIndex = (maxColumnLength  - (gridPosition / _box.size.width))
          .floor()
          .toInt();
      int colIndex = ((offset.dx - gridLeft) / _box.size.width)
          .floor()
          .toInt();
      print("rowIndex=$rowIndex, colIndex=$colIndex");
      var cell = matrix[colIndex][rowIndex];

        if (selectedCells.length <= 1) {
          selectCell(cell);
        } else {
          // if ((selectedCells[0].i == selectedCells[1].i && selectedCells[1].i == cell.i) ||
          //     (selectedCells[0].j == selectedCells[1].j && selectedCells[1].j == cell.j)) {
            if (selectedCells.contains(cell) && selectedCells.last != cell) {
              cell.selected = false;
              selectedCells.remove(cell);
            } else {
              selectCell(cell);
            }
          // }
        }

      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Шормуӵ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.settings)),
              ],
            ),
            Text(subjs[currentSubjectIndex].name, style: TextStyle(fontSize: 20),),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
              child: Center(
                child: Container(
                  key: gridKey,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var i = 0; i < matrix.length; i++)
                          Column(children: List.generate(matrix[i].length, (index) {
                            var j = matrix[i].length - 1 - index;
                            var cell = matrix[i][j];
                            cell.i = i;
                            cell.j = j;
                            maxColumnLength = max(maxColumnLength, matrix[i].length);
                            GlobalKey gridItemKey = new GlobalKey();
                            return GestureDetector(
                              onTapDown: (details) {
                                print("onTapDown ${details} ${cell.letter}");
                                selectItem(gridItemKey, details.globalPosition);
                              },
                              onTapUp: (details) {
                                print("onTapUp ${details} ${cell.letter}");
                                unselectItem(cell);
                              },
                              onPanUpdate: (details) {
                                print("onPanUpdate ${details} ${cell.letter}");
                                selectItem(gridItemKey, details.globalPosition);
                              },
                              onPanEnd: (details) {
                                print("onPanEnd ${details} ${cell.letter}");
                                unselectItem(cell);
                              },
                              child: Padding(
                                key: gridItemKey,
                                padding: const EdgeInsets.all(1.0),
                                child: AnimatedPhysicalModel(
                                  elevation: cell.selected? 8:0,
                                  color: cell.selected
                                      ? Colors.amber
                                      : Colors.amberAccent,
                                  shadowColor: Colors.black,
                                  duration: Duration(milliseconds: 200),
                                  shape: BoxShape.rectangle,
                                  child: SizedBox(
                                    width: 35,
                                    height: 35,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: cell.selected
                                                ? Colors.amber
                                                : Colors.amberAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                        child: Center(child: Text(cell.letter.toLowerCase(), style: TextStyle(fontSize: 20),))),
                                  ),
                                ),
                              ),
                            );
                          })),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void unselectItem(Cell cell) {
    setState(() {
      if (wordsMap[cell.wordIndex].every((c) => c.selected) &&
          selectedCells.every((element) => element.wordIndex == cell.wordIndex)) {
        selectedCells.forEach((selectedCell) {
          print("unvisible = ${selectedCell.letter}");
          matrix.forEach((row) {
            row.remove(selectedCell);
          });
        });
      } else {
        selectedCells.forEach((c) {
          c.selected = false;
        });
      }
    });
    selectedCells.clear();
    if (matrix.every((element) => element.isEmpty)) {
      nextGame();
    }
  }

  void selectCell(Cell cell) {
    if (!selectedCells.contains(cell)) {
      cell.selected = true;
      selectedCells.add(cell);
      SystemSound.play(SystemSoundType.click);
    }
  }
}

List<List<Cell>> generateMatrix(List<String> words) {
  List<List<Cell>> matrix = List.of([
    List.of([]),
  ]);
  words.sort((a, b) => b.length.compareTo(a.length));
  var maxLength = words[0].length;
  for (int i = 0; i < words.length; i++) {
    List<String> chars = words[i].split('');
    if (Random().nextBool()) {
      chars = chars.reversed.toList();
    }
    int columnIndex = Random().nextInt(maxLength);
    for (int j = 0; j < chars.length; j++) {
      var cell = Cell(i, chars[j]);
      if (i == 0) {
        if (matrix.length <= j) {
          matrix.add(List.empty(growable: true));
        }
        matrix[j].insert(0, cell);
      } else if (i % 2 == 1) {
        matrix[columnIndex].insert(j, cell);
      } else if (i % 2 == 0) {
        // по горизонтали
        int minIndex = 1;
        matrix[j].insert(minIndex, cell);
      }
    }
  }
  for (int i = matrix.length - 1; i >= 0; i--) {
    print(matrix[i]);
  }
  return matrix;
}
