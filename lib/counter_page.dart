import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  int index;
  int counter;
  Function increment;

  CounterPage(
      {Key? key,
        required this.index,
        required this.counter,
        required this.increment})
      : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  void _increment() {
    widget.increment(widget.index - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Counter ${widget.index}",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 200,
            ),
            Text(
              "Counter : ${widget.counter}",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: _increment, child: const Text("Increment me!"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
