import 'package:flutter/material.dart';

class CountQuantity extends StatefulWidget {
  final Function(int) onCounterChanged;

  const CountQuantity({super.key, required this.onCounterChanged});

  @override
  State<CountQuantity> createState() => _CountQuantityState();
}

class _CountQuantityState extends State<CountQuantity> {
  int _counter = 1; // Khởi tạo mặc định là 1

  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.onCounterChanged(_counter); // Gọi callback khi thay đổi
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
        widget.onCounterChanged(_counter); // Gọi callback khi thay đổi
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.remove),
              iconSize: 20,
              padding: EdgeInsets.zero,
              onPressed: _decrementCounter,
              color: Colors.teal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '$_counter',
            style: const TextStyle(fontSize: 16, color: Colors.teal),
          ),
        ),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.add),
              iconSize: 20,
              padding: EdgeInsets.zero,
              onPressed: _incrementCounter,
              color: Colors.teal,
            ),
          ),
        ),
      ],
    );
  }
}
