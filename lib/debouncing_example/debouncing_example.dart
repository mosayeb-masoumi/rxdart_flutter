
import 'dart:async';

import 'package:flutter/material.dart';

class DebouncingExample extends StatefulWidget {
  const DebouncingExample({super.key});

  @override
  State<DebouncingExample> createState() => _DebouncingExampleState();
}

class _DebouncingExampleState extends State<DebouncingExample> {
  late TextEditingController _textEditingController;
  Timer? _debounceTimer;

  String myText = "";

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onTextChanges(String value) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
      // Perform your desired action after debounce delay (500 milliseconds in this example)
      print('Performing action: $value');

      setState(() {
        myText = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debouncing Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              onChanged: _onTextChanges,
              // onChanged: (String value) {
              //   _onTextChanges(value);
              // },
              decoration: const InputDecoration(
                labelText: 'Type something',
              ),
            ),
            
            Text(myText)
          ],
        ),
      ),
    );
  }
}
