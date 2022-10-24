import 'package:flutter/material.dart';

import '../widgets/calculations_screen/age_weight.dart';
import '../widgets/calculations_screen/gender.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

double myresult = 30.0;

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Gender: $mygender'),
              Text('Result: $myresult'),
              Text('Healthness : ${healthness(myresult)}',
                  textAlign: TextAlign.center),
              Text('Age: $myage'),
            ],
          ),
        ),
      ),
    );
  }
}

String healthness(double x) {
  if (x.isNaN) {
    return 'NaN';
  } else if (x < 18.5) {
    return 'UnderWeight';
  } else if (x < 25) {
    return 'Normal';
  } else if (x < 30) {
    return 'OverWeight';
  } else {
    return 'Obese';
  }
}
