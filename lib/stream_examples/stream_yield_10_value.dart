
import 'package:flutter/material.dart';

class StreamYieldExample extends StatefulWidget {
  const StreamYieldExample({super.key});

  @override
  State<StreamYieldExample> createState() => _StreamYieldExampleState();
}

class _StreamYieldExampleState extends State<StreamYieldExample> {
  late Stream<int> _stream;
  List<int> _values = [];

  @override
  void initState() {
    super.initState();
    _stream = _generateNumbers().asBroadcastStream();
  }

  Stream<int> _generateNumbers() async* {
    for(int i =0 ; i<=10 ; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<int>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasData) {
              _values.add(snapshot.data!);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _values.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),

                  Text(
                    snapshot.data!.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              );


            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
