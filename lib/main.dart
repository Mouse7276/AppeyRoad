import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

void main() {
  int gwang = 0;
  int godori = 0;
  int dan = 0;
  int pi = 0;
  bool _3gwang = false;
  bool _5gwang = false;
  bool _godori = false;
  bool _chungdan = false;
  bool _hongdan = false;
  bool _chodan = false;
  bool _bomb = false;

  runApp(MyApp());
}

final PageController pageController = PageController(
  initialPage: 0,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// HomeScreen
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[Score(), RandomNum(), RandomPlayer(), Betting()],
      ),
    );
  }
}

// AppScrollBehavior
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

// Random Player selector
class RandomPlayer extends StatefulWidget {
  const RandomPlayer({Key? key}) : super(key: key);

  @override
  _RandomPlayerState createState() => _RandomPlayerState();
}

class _RandomPlayerState extends State<RandomPlayer> {
  List<String> PlayerList = ['a'];
  String SelectedPlayer = 'b';
  int PlayerNum = 0;
  int SelectedPlayerNum = 0;

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(children: [
                // Show Selected Player
                Container(
                  child: Center(
                    child: Text(SelectedPlayer),
                  ),
                ),

                // Show PlayerList
                Container(
                  child: Center(
                    child: Text(PlayerList.join(",")),
                  ),
                )
              ]),
            ),

            // Enter the Player
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          PlayerList = [];
                        });
                      },
                      icon: Icon(Icons.clear)),
                  hintText: "Enter the Name",
                  border: OutlineInputBorder()),
            ),

            // Add Player to List Button
            MaterialButton(
                onPressed: () {
                  setState(() {
                    PlayerList.add(_textController.text);
                  });
                },
                color: Colors.red,
                child: Text("Enter")),

            // Generate Random Player
            MaterialButton(
                onPressed: () {
                  setState(() {
                    PlayerNum = PlayerList.length;
                    SelectedPlayerNum = Random().nextInt(PlayerNum);
                    SelectedPlayer = PlayerList[SelectedPlayerNum];
                  });
                },
                color: Colors.blue,
                child: Text("Generate")),
          ],
        ),
      ),
    );
  }
}

// Random Number Generator
class RandomNum extends StatefulWidget {
  const RandomNum({Key? key}) : super(key: key);

  @override
  _RandomNumState createState() => _RandomNumState();
}

class _RandomNumState extends State<RandomNum> {
  int Limit = 0;
  int Num_int = 0;
  String show = '';
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                child: Center(
                  child: Text(show),
                ),
              )),
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: Icon(Icons.clear)),
                    hintText: "Limit",
                    border: OutlineInputBorder()),
              ),
              MaterialButton(
                  onPressed: () {
                    setState(() {
                      Limit = int.parse(_textController.text);
                      Num_int = Random().nextInt(Limit) + 1;
                      show = Num_int.toString();
                    });
                  },
                  color: Colors.blue,
                  child: Text("Generate")),
            ]),
      ),
    );
  }
}

int gwang = 0;
int godori = 0;
int dan = 0;
int pi = 0;
int score = 0;
bool _3gwang = false;
bool _5gwang = false;
bool _godori = false;
bool _chungdan = false;
bool _hongdan = false;
bool _chodan = false;
bool _bomb = false;

// Score
class Score extends StatefulWidget {
  const Score({Key? key}) : super(key: key);
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // 광
          Row(
            children: [
              Icon(
                FontAwesomeIcons.lightbulb,
                size: 60,
              ),
              SizedBox(width: 20),
              Container(
                width: 120,
                child: Text(
                  "광",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(width: 20),
              Container(
                child: Center(
                  child: Text(
                    gwang.toString(),
                    style: TextStyle(fontSize: 60),
                  ),
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    setState(() {
                      gwang = gwang + 1;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.caretUp),
                  iconSize: 40),
              IconButton(
                  onPressed: () {
                    setState(() {
                      gwang = gwang - 1;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.caretDown),
                  iconSize: 40),
              SizedBox(width: 20),
              Icon(Icons.three_g_mobiledata, size: 40),
              Checkbox(
                  value: _3gwang,
                  onChanged: (bool? value) {
                    setState(() {
                      _3gwang = value!;
                    });
                  }),
              Icon(Icons.five_g, size: 40),
              Checkbox(
                  value: _5gwang,
                  onChanged: (bool? value) {
                    setState(() {
                      _5gwang = value!;
                    });
                  }),
            ],
          ),

          // 고도리
          Row(
            children: [
              Icon(
                FontAwesomeIcons.kiwiBird,
                size: 60,
              ),
              SizedBox(width: 20),
              Container(
                width: 120,
                child: Text(
                  "고도리",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(width: 20),
              Container(
                child: Center(
                  child: Text(
                    godori.toString(),
                    style: TextStyle(fontSize: 60),
                  ),
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    setState(() {
                      godori = godori + 1;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.caretUp),
                  iconSize: 40),
              IconButton(
                  onPressed: () {
                    setState(() {
                      godori = godori - 1;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.caretDown),
                  iconSize: 40),
              SizedBox(width: 20),
              Icon(FontAwesomeIcons.kiwiBird, size: 40),
              SizedBox(width: 10),
              Checkbox(
                  value: _godori,
                  onChanged: (bool? value) {
                    setState(() {
                      _godori = value!;
                    });
                  }),
            ],
          ),

          // 청단, 홍단, 초단
          Row(
            children: [
              Icon(
                FontAwesomeIcons.bacon,
                size: 60,
              ),
              SizedBox(width: 20),
              Container(
                width: 120,
                child: Text(
                  "단",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(width: 20),
              Container(
                child: Center(
                  child: Text(
                    dan.toString(),
                    style: TextStyle(fontSize: 60),
                  ),
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    setState(() {
                      dan = dan + 1;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.caretUp),
                  iconSize: 40),
              IconButton(
                  onPressed: () {
                    setState(() {
                      dan = dan - 1;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.caretDown),
                  iconSize: 40),
              SizedBox(width: 20),
              Icon(
                Icons.circle,
                size: 40,
                color: Colors.red,
              ),
              Checkbox(
                  value: _hongdan,
                  onChanged: (bool? value) {
                    setState(() {
                      _hongdan = value!;
                    });
                  }),
              Icon(
                Icons.circle,
                size: 40,
                color: Colors.blue,
              ),
              Checkbox(
                  value: _chungdan,
                  onChanged: (bool? value) {
                    setState(() {
                      _chungdan = value!;
                    });
                  }),
              Icon(
                Icons.circle,
                size: 40,
                color: Colors.green,
              ),
              Checkbox(
                  value: _chodan,
                  onChanged: (bool? value) {
                    setState(() {
                      _chodan = value!;
                    });
                  }),
            ],
          ),

          // 피
          Row(
            children: [
              Icon(
                FontAwesomeIcons.star,
                size: 60,
              ),
              SizedBox(width: 20),
              Container(
                width: 120,
                child: Text(
                  "피",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(width: 20),
              Container(
                child: Center(
                  child: Text(
                    pi.toString(),
                    style: TextStyle(fontSize: 60),
                  ),
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                  onPressed: () {
                    setState(() {
                      pi = pi + 1;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.caretUp),
                  iconSize: 40),
              IconButton(
                  onPressed: () {
                    setState(() {
                      pi = pi - 1;
                    });
                  },
                  icon: Icon(FontAwesomeIcons.caretDown),
                  iconSize: 40),
              SizedBox(width: 20),
              Icon(FontAwesomeIcons.bomb, size: 40),
              Checkbox(
                  value: _bomb,
                  onChanged: (bool? value) {
                    setState(() {
                      _bomb = value!;
                    });
                  }),
            ],
          ),

          // 계산
          MaterialButton(
              onPressed: () {
                setState(() {
                  score = 0;
                  if (_3gwang == true) {
                    score += 3;
                  }
                  if (_5gwang == true) {
                    score += 5;
                  }
                  if (godori > 4) {
                    score += (godori - 4);
                  }
                  if (_godori == true) {
                    score += 5;
                  }
                  if (_hongdan == true) {
                    score += 3;
                  }
                  if (_chodan == true) {
                    score += 3;
                  }
                  if (_chungdan == true) {
                    score += 3;
                  }
                  if (dan > 4) {
                    score += (dan - 4);
                  }
                  if (pi > 9) {
                    score += (pi - 9);
                  }

                  if (_bomb == true) {
                    score = score * 2;
                  }
                });
              },
              color: Colors.blue,
              child: Text("Calculate")),

          MaterialButton(
              onPressed: () {
                setState(() {
                  gwang = 0;
                  godori = 0;
                  dan = 0;
                  pi = 0;
                  score = 0;
                  _3gwang = false;
                  _5gwang = false;
                  _godori = false;
                  _chungdan = false;
                  _hongdan = false;
                  _chodan = false;
                  _bomb = false;
                });
              },
              color: Colors.red,
              child: Text("Reset")),
          SizedBox(height: 50),

          // 점수표시
          Container(
            child: Center(
                child: Text(
              score.toString(),
              style: TextStyle(fontSize: 60),
            )),
          )
        ],
      ),
    );
  }
}

// Betting
class Betting extends StatefulWidget {
  const Betting({Key? key}) : super(key: key);

  @override
  _BettingState createState() => _BettingState();
}

class _BettingState extends State<Betting> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
