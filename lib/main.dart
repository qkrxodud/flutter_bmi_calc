import 'package:flutter/material.dart';
import 'package:flutter_bmi_calc/result.dart';

import 'input.dart';

void main() {
  runApp(const BMICalc());
}

class BMICalc extends StatelessWidget {
  const BMICalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/input',
      routes: {
        '/input' : (context) => const Input(),
      },
      theme: ThemeData.dark().copyWith( // copyWith를 사용해서 다크 테마에서 내가 원하는 테마로 변경 가능하다.
          scaffoldBackgroundColor: Color(0xff0a0e21),//App의 scaffold의 백그라운드 색상이 변경된다.
          textTheme: const TextTheme(
            bodyText2: TextStyle(color: Colors.white), // 기본 글씨 색상 변경
          )
      ),
    );
  }
}


