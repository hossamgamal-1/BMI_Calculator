import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/calculations_provider/calculations_provider.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    var watch = context.watch<CalculationsProvider>();
    var read = context.read<CalculationsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Gender: ${watch.mygender}'),
              Text('Result: ${watch.myresult}'),
              Text('Healthness : ${read.healthness()}',
                  textAlign: TextAlign.center),
              Text('Age: ${watch.myage}'),
            ],
          ),
        ),
      ),
    );
  }
}
