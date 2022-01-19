import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.brown,
                displayColor: Colors.white,
              )),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rainbow'),
      ),
      body: ListWheelScrollView(
        children: [
          Container(
            color: Colors.red,
            height: 300,
          ),
          Container(
            color: Colors.orange,
            height: 300,
          ),
          Container(
            color: Colors.yellow,
            height: 300,
          ),
          Container(
            color: Colors.green,
            height: 300,
          ),
          Container(
            color: Colors.blue,
            height: 300,
          ),
          Container(
            color: Colors.cyan,
            height: 300,
          ),
          Container(
            color: Colors.purple,
            height: 300,
          ),
        ],
        itemExtent: 200,
      ),
    );
  }
}
