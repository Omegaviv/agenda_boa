import 'package:untitled/counter_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<int> counterValues = [0, 0, 0];

  void incrementCounterValues(int index) {
    setState(() {
      counterValues[index]++;
    });
  }

  List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addPages() {
    _widgetOptions.clear();
    _widgetOptions.add(
      CounterPage(
          index: 1,
          counter: counterValues[0],
          increment: incrementCounterValues),
    );
    _widgetOptions.add(
      CounterPage(
          index: 2,
          counter: counterValues[1],
          increment: incrementCounterValues),
    );
    _widgetOptions.add(
      CounterPage(
          index: 3,
          counter: counterValues[2],
          increment: incrementCounterValues),
    );
  }

  @override
  Widget build(BuildContext context) {
    addPages();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: SafeArea(
        child: Center(
          child: _widgetOptions[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Text("C1"),
            label: 'Counter 1',
          ),
          BottomNavigationBarItem(
            icon: Text("C2"),
            label: 'Counter 2',
          ),
          BottomNavigationBarItem(
            icon: Text("C3"),
            label: 'Counter 3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
