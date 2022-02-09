import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_calc/person_data.dart';

class Result extends StatelessWidget {

  final PersonData personData;
  Result({required this.personData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0e21),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('BMI CALC'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Your Result',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: const Color(0xff1d1e33), borderRadius: BorderRadius.circular(10.0)),
                child: Column(children:  [
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(personData.getMsg(),style: const TextStyle(color: Colors.green),
                      ))),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '${personData.getBMIValue().toStringAsFixed(2)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
                      )),
                  Expanded(flex: 1, child: Center(child: Text(personData.getExplanation(), textAlign: TextAlign.center,))),
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(10.0)),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'RE-CALC',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
