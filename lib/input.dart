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
  PersonData personData = PersonData(Gender.male, 100, 100, 100);

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
                  Expanded(
                    flex: 1,
                      child: genderCard(Gender.male)),
                  const SizedBox(width: 5,),
                  Expanded(
                      flex: 1,
                      child: genderCard(Gender.female)),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff1d1e33),
                  borderRadius: BorderRadius.circular(10.0)
                ),
                height: 50,
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: card(nonActiveCardColor)),
                  const SizedBox(width: 5,),
                  Expanded(
                      flex: 1,
                      child: card(nonActiveCardColor)),
                ],
              ),
            ),
            Container(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget genderCard(Gender gender) {

    Color activeColor = personData.getGender() == gender? activeCardColor : nonActiveCardColor;
    String genderText = gender == Gender.male ? 'MALE' : 'FEMALE';
    IconData genderIcon = gender == Gender.male ? Icons.male : Icons.female;

    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero
        ),
        onPressed: () {
          setState(() {
            personData.setGender(gender);
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color:  activeColor,
              borderRadius: BorderRadius.circular(10.0)
          ),
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
              Text(genderText, style: const TextStyle(color: Colors.white),)
            ],
          ),
        ));
  }

  Widget card(Color color) {
    return TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero
        ),
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
              color:  color,
              borderRadius: BorderRadius.circular(10.0)
          ),
          height: 150,
        ));
  }
}
