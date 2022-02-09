class DefaultBMIStatus {
  double _bmiValue = 18.3;
  String _msg = 'Normal';
  String _explanation = 'You have a higher weight than normal. Try to lose somme through any activity you like!';

  void calcBMIResult() {
    if (_bmiValue > 25) {
      _msg = 'Over weight';
      _explanation = 'You have a higher weight than normal. Try to lose somme through any activity you like!';
    } else if (_bmiValue > 18.5) {
      _msg = 'Normal';
      _explanation = 'You have a normal weight. Keep it!';
    } else {
      _msg = 'Under Weight';
      _explanation = 'Your weight is less than normal weight. You need to get some. Make sure to have a correct and balanced diet.';
    }
  }

  void setBMIValue(double bmiValue) {
    _bmiValue = bmiValue;
  }

  String msg() {
    return _msg;
  }

  String explanation() {
    return _explanation;
  }

  double getBMIValue () {
    return _bmiValue;
  }

  String getMsg() {
    return _msg;
  }

  String getExplanation() {
    return _explanation;
  }
}