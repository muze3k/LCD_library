import 'dart:async'; // Import for Completer
import 'dart:typed_data'; // Import for Uint8List
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ImageFromArrayWidget extends StatefulWidget {
  @override
  _ImageFromArrayWidgetState createState() => _ImageFromArrayWidgetState();
}

class _ImageFromArrayWidgetState extends State<ImageFromArrayWidget> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();
    _createImageFromPixels();
  }

  void _createImageFromPixels() async {
    final int width = 64;
    final int height = 64;
    //List<List<int>> array = List.generate(height, (i) => List.filled(width,  i % 2 == 0 ? 0 : 255));

    //List<List<int>> array = List.generate(height, (i) => List.filled(width, i % 2 == 0 ? 0 : 255));
    List<List<int>> array = List.generate(height, (_) => List.filled(width, 0));
    // "Draw" on the image by changing pixel values

    // Draw vertical boundary
    for (int i = 0; i < height; i++) {
      array[i][0] = 120; // [rows][column]
      array[i][1] = 120;
      array[i][width - 2] = 120;
      array[i][width - 1] = 120;
    }

    // Draw horizontal boundary
    for (int i = 0; i < width; i++) {
      array[0][i] = 120; // [rows][column]
      array[1][i] = 120;
      array[height - 2][i] = 120;
      array[height - 1][i] = 120;
    }

    // "Export" the image by printing the array
    //displaySmallNumber(image, 0,5,clockstart,1); // array, number, startrow, startcol, color

    //displaySmallClock(array, 5, 5, "02:35", 200);

    //displaySmallLetter(image, 'x', 30, 30, 1); // array, alphabaet, row, col, color

    //displaySmallWord(array, 30, 10, 'hello', 200);
    displaySmallWord(array, 5, 3, 'home', 200);
    displaySmallClock(array, 5, 23, "00:00", 200);
    displaySmallWord(array, 5, 43, 'away', 200);
    
    displaySmallWord(array, 20, 5, 'bonus', 200);
    displaySmallWord(array, 20, 40, 'bonus', 200);
    

    //printImage(image);

    //final int width = 64;
    //final int height = 64;
    // Example array
    //List<List<int>> array = List.generate(height, (i) => List.filled(width, i % 2 == 0 ? 0 : 255));

    List<int> pixels = [];
    for (var row in array) {
      for (var value in row) {
        pixels.addAll([value, value, value, 255]); // RGBA
      }
    }

    final Completer<ui.Image> completer =
        Completer(); // Correctly imported Completer
    ui.decodeImageFromPixels(
      Uint8List.fromList(pixels), // Correct usage of Uint8List
      width,
      height,
      ui.PixelFormat.rgba8888,
      completer.complete,
    );

    image = await completer.future;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image from Array'),
      ),
      body: Center(
        child: image == null
            ? CircularProgressIndicator()
            : CustomPaint(
                painter: _ImagePainter(image!),
              ),
      ),
    );
  }
}

class _ImagePainter extends CustomPainter {
  final ui.Image image;

  _ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

void main() {
  runApp(MaterialApp(home: ImageFromArrayWidget()));
}

List<List<int>> displaySmallWord(List<List<int>> myList, int startingrow,
    int startingcol, String word, int color) {
  List<String> chars = word.split('');
  for (String character in chars) {
    //print(character);
    displaySmallLetter(myList, character, startingrow, startingcol,
        color); // array, alphabaet, row, col, color
    startingcol = startingcol + 4;
  }
  return myList;
}

List<List<int>> displaySmallLetter(List<List<int>> myList, String alphabet,
    int startingrow, int startingcol, int color) {
  switch (alphabet) {
    case 'a':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }

      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 'b':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }

      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;

      break;
    case 'c':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }

      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 2][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol + 2] = 0;
      break;
    case 'd':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }

      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;

    case 'e':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 2] = 0;
      break;
    case 'f':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 2] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol + 2] = 0;
      break;
    case 'g':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 'h':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 'i':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = 0;
        }
      }
      myList[startingrow][startingcol + 1] = color;
      myList[startingrow + 1][startingcol + 1] = color;
      myList[startingrow + 2][startingcol + 1] = color;
      myList[startingrow + 3][startingcol + 1] = color;
      myList[startingrow + 4][startingcol + 1] = color;
      break;
    case 'j':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol] = 0;
      myList[startingrow + 2][startingcol] = 0;
      myList[startingrow + 3][startingcol] = 0;

      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 2][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol + 2] = 0;
      myList[startingrow + 4][startingcol + 2] = 0;
      break;
    case 'k':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 2] = 0;
      break;
    case 'l':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = 0;
        }
      }
      myList[startingrow][startingcol] = color;
      myList[startingrow + 1][startingcol] = color;
      myList[startingrow + 2][startingcol] = color;
      myList[startingrow + 3][startingcol] = color;
      myList[startingrow + 4][startingcol] = color;
      myList[startingrow + 4][startingcol + 1] = color;
      myList[startingrow + 4][startingcol + 2] = color;
      break;
    case 'm':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 'n':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow][startingcol + 1] = 0;
      //myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 'o':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
    case 'p':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol + 2] = 0;
      break;
    case 'q':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 'r':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 2] = 0;
      break;
    case 's':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
    case 't':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol] = 0;
      myList[startingrow + 2][startingcol] = 0;
      myList[startingrow + 3][startingcol] = 0;
      myList[startingrow + 4][startingcol] = 0;
      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 2][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol + 2] = 0;
      myList[startingrow + 4][startingcol + 2] = 0;
      break;
    case 'u':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 0][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
    case 'v':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 0][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol] = 0;
      myList[startingrow + 4][startingcol + 2] = 0;
      break;
    case 'w':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 0][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      //myList[startingrow + 4][startingcol] = 0;
      //myList[startingrow + 4][startingcol+2] = 0;
      break;
    case 'x':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = 0;
        }
      }
      myList[startingrow + 1][startingcol] = color;
      myList[startingrow + 1][startingcol + 2] = color;
      myList[startingrow + 2][startingcol + 1] = color;
      myList[startingrow + 3][startingcol] = color;
      myList[startingrow + 3][startingcol + 2] = color;
      break;
    case 'y':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
    case 'z':
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        }
      }
      myList[startingrow + 1][startingcol] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 2] = 0;
      break;
  }

  return myList;
}

List<List<int>> displaySmallClock(List<List<int>> myList, int clockstartrow,
    clockstartcol, String time, int color) {
  // Step 1: Split the string by ':'
  List<String> parts = time.split(':');

  // Step 2 & 3: Split each part into individual characters and convert to int
  List<int> numbers = [];
  for (String part in parts) {
    numbers.addAll(part.split('').map(int.parse));
  }
  displaySmallNumber(myList, numbers[0], clockstartrow, clockstartcol,
      color); // array, number, startrow, startcol, color
  displaySmallNumber(
      myList, numbers[1], clockstartrow, clockstartcol + 4, color);
  displaySmallNumber(
      myList, numbers[2], clockstartrow, clockstartcol + 8, color);
  displaySmallNumber(
      myList, numbers[3], clockstartrow, clockstartcol + 12, color);
  return myList;
}

List<List<int>> displaySmallNumber(List<List<int>> myList, int number,
    int startingrow, int startingcol, int color) {
  switch (number) {
    case 1:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          if (col - startingcol == 1) {
            myList[row][col] = color;
          } else {
            myList[row][col] = 0;
          }
        } // cols
      }
      ; // rows
      break;
    case 2:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow + 1][startingcol] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 2] = 0;
      break;
    case 3:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow + 1][startingcol] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
    case 4:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 5:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
    case 6:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 1][startingcol + 2] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
    case 7:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow + 1][startingcol] = 0;
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 8:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
    case 9:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      myList[startingrow + 4][startingcol] = 0;
      myList[startingrow + 4][startingcol + 1] = 0;
      break;
    case 0:
      for (int row = startingrow; row < (startingrow + 5); row++) {
        for (int col = startingcol; col < (startingcol + 3); col++) {
          myList[row][col] = color;
        } // cols
      }
      ; // rows
      myList[startingrow + 1][startingcol + 1] = 0;
      myList[startingrow + 2][startingcol + 1] = 0;
      myList[startingrow + 3][startingcol + 1] = 0;
      break;
  }
  return myList;
}
