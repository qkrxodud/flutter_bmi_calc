enum Gender{
  male, female
}

class PersonData {
  late Gender _gender;
  late double _height;
  late int _weight;
  late int _age;

  PersonData({required gender, required height, required weight, required age}) {
    _gender = gender;
    _height = height;
    _weight = weight;
    _age = age;
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

  double calcBMI() {
    double mHeight = _height/100;
    print(_weight/(mHeight*mHeight));
    return _weight/(mHeight*mHeight);
  }
}