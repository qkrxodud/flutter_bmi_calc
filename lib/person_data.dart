import 'default_bmi_status.dart';

enum Gender{
  male, female
}

class PersonData {
  late Gender _gender;
  late double _height;
  late int _weight;
  late int _age;
  late DefaultBMIStatus _defaultBMIStatus;

  PersonData({required gender, required height, required weight, required age, required defaultBMIStatus}) {
    _gender = gender;
    _height = height;
    _weight = weight;
    _age = age;
    _defaultBMIStatus = defaultBMIStatus;
  }

  Gender getGender() {
    return _gender;
  }

  void setGender(Gender gender) {
    _gender = gender;
  }

  double getHeight() {
    return _height;
  }

  void setHeight(double height) {
    _height = height;
  }

  void addWeight() {
    ++_weight;
  }

  void minusWeight() {
    --_weight;
  }

  int getWeight() {
    return _weight;
  }

  void addAge() {
    ++_age;
  }

  void minusAge() {
    --_age;
  }

  int getAge() {
    return _age;
  }

  void calcBMI() {
    double mHeight = _height/100;
    double bmiCalc = _weight/(mHeight*mHeight);

    _defaultBMIStatus.setBMIValue(bmiCalc);
    _defaultBMIStatus.calcBMIResult();
  }

  double getBMIValue () {
    return _defaultBMIStatus.getBMIValue();
  }

  String getMsg() {
    return _defaultBMIStatus.getMsg();
  }

  String getExplanation() {
    return _defaultBMIStatus.getExplanation();
  }
}