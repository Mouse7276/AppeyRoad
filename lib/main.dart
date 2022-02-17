import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List generated = [];
  // int numlimit = 100;
  // void Generate() {
  //   setState(() {
  //     generated.add(Random().nextInt(numlimit) + 1);
  //   });
  // }
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
    // return Scaffold(
    //   appBar: AppBar(title: Text("Random int Generator")),
    //   body: ListView.separated(
    //     padding: const EdgeInsets.all(7),
    //     itemCount: generated.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       if (numlimit == -1) {
    //         return Container(
    //           child: TextField(
    //             controller: _textController,
    //             decoration: InputDecoration(
    //                 hintText: "Limit",
    //                 suffixIcon: IconButton(
    //                   icon: Icon(Icons.save),
    //                   onPressed: () {
    //                     numlimit = int.parse(_textController.text);
    //                   },
    //                 )),
    //           ),
    //         );
    //       }
    //       if (numlimit != -1) {
    //         return Container(
    //           child: Text(generated[index].toString()),
    //         );
    //       }
    //       print(generated);
    //       return Container();
    //     },
    //     separatorBuilder: (context, index) {
    //       return Divider();
    //     },
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: Generate,
    //     tooltip: "Generate",
    //     child: Icon(Icons.plus_one),
    //   ),
    // );
  }
}
