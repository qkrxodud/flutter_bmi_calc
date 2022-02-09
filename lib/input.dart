import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_calc/person_data.dart';

const Color activeCardColor = Color(0xff111328);
const Color nonActiveCardColor = Color(0xff1d1e33);

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  PersonData personData = PersonData(gender: Gender.male, height: 130.0, weight: 100, age: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0a0e21),
        title: const Center(child: Text('BMI CALC')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 1, child: genderCard(Gender.male)),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(flex: 1, child: genderCard(Gender.female)),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: const Color(0xff1d1e33), borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic, //로우에서 글자를 밑에 기준으로 잡아준다.
                      children: [
                        Text(personData.getHeight().toStringAsFixed(2)),
                        const Text('cm'),
                      ],
                    ),
                    Slider(
                        value: personData.getHeight(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            personData.setHeight(newValue);
                          });
                        })
                  ],
                ),
                height: 50,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: card(
                          nonActiveCardColor,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('WEIGHT'),
                              Text('${personData.getWeight()}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                      elevation: 6.0,
                                      fillColor: Color(0xff4c4f5e),
                                      constraints: const BoxConstraints.tightFor(
                                        height: 40.0,
                                        width: 40.0,
                                      ),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(),
                                      ),
                                      shape: CircleBorder(),
                                      onPressed: () {
                                        setState(() {
                                          personData.addWeight();
                                        });
                                      }),
                                  RawMaterialButton(
                                      elevation: 6.0,
                                      constraints: const BoxConstraints.tightFor(
                                        height: 40.0,
                                        width: 40.0,
                                      ),
                                      fillColor: const Color(0xff4c4f5e),
                                      shape: const CircleBorder(),
                                      child: const Text('-'),
                                      onPressed: () {
                                        setState(() {
                                          personData.minusWeight();
                                        });
                                      }),
                                ],
                              )
                            ],
                          ))),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      flex: 1,
                      child: card(
                          nonActiveCardColor,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('AGE'),
                              Text('${personData.getAge()}'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                      elevation: 6.0,
                                      fillColor: Color(0xff4c4f5e),
                                      constraints: const BoxConstraints.tightFor(
                                        height: 40.0,
                                        width: 40.0,
                                      ),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(),
                                      ),
                                      shape: const CircleBorder(),
                                      onPressed: () {
                                        setState(() {
                                          personData.addAge();
                                        });
                                      }),
                                  RawMaterialButton(
                                      elevation: 6.0,
                                      constraints: const BoxConstraints.tightFor(
                                        height: 40.0,
                                        width: 40.0,
                                      ),
                                      fillColor: const Color(0xff4c4f5e),
                                      shape: const CircleBorder(),
                                      child: const Text('-'),
                                      onPressed: () {
                                        setState(() {
                                          personData.minusAge();
                                        });
                                      }),
                                ],
                              )
                            ],
                          ))),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Center(
                  child: TextButton(onPressed: () {
                    personData.calcBMI();

                  }, child: const Text('Calc your BMI', style: TextStyle(color: Colors.white)), )),
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget genderCard(Gender gender) {
    Color activeColor = personData.getGender() == gender ? activeCardColor : nonActiveCardColor;
    String genderText = gender == Gender.male ? 'MALE' : 'FEMALE';
    IconData genderIcon = gender == Gender.male ? Icons.male : Icons.female;

    return TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          setState(() {
            personData.setGender(gender);
          });
        },
        child: Container(
          decoration: BoxDecoration(color: activeColor, borderRadius: BorderRadius.circular(10.0)),
          height: 150,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                genderIcon,
                color: Colors.white,
                size: 50,
              ),
              Text(
                genderText,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ));
  }

  Widget card(Color color, Widget columnWidget) {
    return TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {},
        child: Container(
          child: columnWidget,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10.0)),
          height: 150,
        ));
  }
}
