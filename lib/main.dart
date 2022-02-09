import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: _title,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

final PageController pageController = PageController(
  initialPage: 0,
);

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          HomeScreen1(),
          HomeScreen2(),
          HomeScreen3(),
        ],
      ),
    );
  }
}

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  var _boolfirst = false;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          CheckboxListTile(
            value: _boolfirst,
            title: Text('First Checkbox'),
            subtitle: Text('this is first checkbox'),
            activeColor: Colors.green,
            checkColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            secondary: Container(
              height: 100,
              child: Icon(Icons.hourglass_empty),
            ),
            onChanged: (value) {
              setState(() {
                _boolfirst = value!;
              });
            },
          ),
          Container(
            height: 300,
            color: Colors.amber[600],
            child: const Center(child: Text('A')),
          ),
          Container(
            height: 300,
            color: Colors.amber[500],
            child: const Center(child: Text('B')),
          ),
          Container(
            height: 300,
            color: Colors.amber[400],
            child: const Center(child: Text('C')),
          ),
          Container(
            height: 300,
            color: Colors.amber[300],
            child: const Center(child: Text('D')),
          ),
          Container(
            height: 300,
            color: Colors.amber[200],
            child: const Center(child: Text('E')),
          ),
          Container(
            height: 300,
            color: Colors.amber[100],
            child: const Center(child: Text('F')),
          ),
        ],
      ),
    );
  }
}

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          Container(
            height: 60,
            color: Colors.amber[600],
            child: const Center(child: Text('A')),
          ),
          Container(
            height: 60,
            color: Colors.amber[500],
            child: const Center(child: Text('B')),
          ),
          Container(
            height: 60,
            color: Colors.amber[400],
            child: const Center(child: Text('C')),
          ),
          Container(
            height: 60,
            color: Colors.amber[300],
            child: const Center(child: Text('D')),
          ),
          Container(
            height: 60,
            color: Colors.amber[200],
            child: const Center(child: Text('E')),
          ),
          Container(
            height: 60,
            color: Colors.amber[100],
            child: const Center(child: Text('F')),
          ),
        ],
      ),
    );
  }

  launch(String s) {}
}

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({Key? key}) : super(key: key);

  @override
  _HomeScreen3State createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 150,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("New Appbar", style: TextStyle(color: Colors.black)),
            background: Image.asset(
              'images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining(
          child: Scrollbar(
            isAlwaysShown: true,
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                Container(
                  height: 60,
                  color: Colors.amber[600],
                  child: const Center(child: Text('A')),
                ),
                Container(
                  height: 60,
                  color: Colors.amber[500],
                  child: const Center(child: Text('B')),
                ),
                Container(
                  height: 60,
                  color: Colors.amber[400],
                  child: const Center(child: Text('C')),
                ),
                Container(
                  height: 60,
                  color: Colors.amber[300],
                  child: const Center(child: Text('D')),
                ),
                Container(
                  height: 60,
                  color: Colors.amber[200],
                  child: const Center(child: Text('E')),
                ),
                Container(
                  height: 60,
                  color: Colors.amber[100],
                  child: const Center(child: Text('F')),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
