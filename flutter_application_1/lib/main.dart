import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _num = 0;
  int _fact = 1;
  List<int> _multiples = [];
  String _re = '';

  void Factorial() {
    int factorial = 1;
    for (int i = 1; i <= _num; i++) {
      factorial *= i;
    }
    setState(() {
      _fact = factorial;
    });
  }

  void p_n() {
    String message = '';
    if (_num> 0) {
      message = ' positive.';
    } else if (_num < 0) {
      message = '  negative.';
    } else {
      message = ' zero.';
    }
    setState(() {
      _re = message;
    });
  }

  void f_Multiples() {
    List<int> multiples = [];
    for (int i = 1; i <= 10; i++) {
      multiples.add(_num * i);
    }
    setState(() {
      _multiples = multiples;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asma al-dhafari'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
              ),
              onChanged: (value) {
                setState(() {
                  _num = int.tryParse(value)!;
                  _fact = 0;
                  _multiples = [];
                  _re = '';
                });
              },
            ),
            ElevatedButton(
              child: Text(' Factorial'),
              onPressed: _num != 0 ? Factorial : null,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text(' Positive/Negative'),
              onPressed: _num != 0 ? p_n : null,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text(' Multiples'),
              onPressed: _num != 0 ? f_Multiples : null,
            ),
            SizedBox(height: 16.0),
            Text(_fact != 0 ? 'Factorial: $_fact' : ''),
            Text(_re),
            if (_multiples.isNotEmpty)
              Column(
                children: [
                  SizedBox(height: 16.0),
                  Text('Multiples:'),
                  for (int multiple in _multiples) Text(multiple.toString()),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
