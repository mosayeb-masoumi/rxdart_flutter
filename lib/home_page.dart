
import 'package:flutter/material.dart';
import 'package:rx_dart_example/debouncing_example/debouncing_example.dart';
import 'package:rx_dart_example/stream_examples/stream_example.dart';
import 'package:rx_dart_example/stream_examples/stream_yield_10_value.dart';
import 'package:rx_dart_example/throttler%20_example/throttler_example.dart';
import 'package:rxdart/rxdart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StreamExample()));
            }, child: const Text("Stream example")),

            const SizedBox(height:5,),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StreamYieldExample()));
            }, child: const Text("Stream Yield example")),

            const SizedBox(height:5,),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DebouncingExample()));
            }, child: const Text("Debouncing example")),

            const SizedBox(height:5,),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ThrottlerExample()));
            }, child: const Text("Throttler example")),



          ],
        ),
      ),
    );
  }
}
