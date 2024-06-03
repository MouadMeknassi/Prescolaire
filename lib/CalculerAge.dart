class CalculerAge {
  String _birthdateString;
  CalculerAge(this._birthdateString);

  int calculerAge() {
    DateTime birthdate = DateTime.parse(_birthdateString);
    DateTime now = DateTime.now();
    int age = now.year - birthdate.year;

    if (now.month < birthdate.month || (now.month == birthdate.month && now.day < birthdate.day)) {
      age--;
    }
    return age;
  }
}