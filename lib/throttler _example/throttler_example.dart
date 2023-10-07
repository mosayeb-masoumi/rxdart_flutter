import 'dart:async';

import 'package:flutter/material.dart';

class ThrottlerExample extends StatefulWidget {
  const ThrottlerExample({super.key});

  @override
  State<ThrottlerExample> createState() => _ThrottlerExampleState();
}

class _ThrottlerExampleState extends State<ThrottlerExample> {
  final Throttler _throttler = Throttler(const Duration(seconds: 2));
  int _counter = 0;

  void _incrementCounter() {
    _throttler.throttle(() {
      setState(() {
        _counter++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Throttler Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _counter.toString(),
              style: const TextStyle(fontSize: 48),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*************************** first execute then delay ***********************************/
/*************************** good for prevent multiple click on button,
 * after delay button can be pressed again ***********************************/

class Throttler {
  final Duration delay;
  Timer? _timer;
  bool _isThrottled = false;

  Throttler(this.delay);

  void throttle(VoidCallback action) {
    if (!_isThrottled) {
      _isThrottled = true;
      action();
      _timer = Timer(delay, () {
        _isThrottled = false;
      });
    }
  }
}


/*************************** first delay then execute ***********************************/
// class Throttler {
//   final Duration delay;
//   Timer? _timer;
//
//   Throttler(this.delay);
//
//   void throttle(VoidCallback action) {
//     if (_timer?.isActive ?? false) {
//       _timer?.cancel();
//     }
//
//     _timer = Timer(delay, action);
//   }
// }
