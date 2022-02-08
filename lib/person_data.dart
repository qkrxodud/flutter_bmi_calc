enum Gender{
  male, female
}

class PersonData {
  late Gender _gender;
  late int _height;
  late int _weight;
  late int _age;

  PersonData(this._gender, this._height, this._weight, this._age);

  Gender getGender() {
    return _gender;
  }

  setGender(Gender gender) {
    _gender = gender;
  }
}