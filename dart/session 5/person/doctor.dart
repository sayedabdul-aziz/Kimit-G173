import 'person.dart';

class Doctor extends Person {
  double? salary;

  Doctor(int? id, int? age, String? name, Gender gender, this.salary)
      : super(id, name, gender, age);

  displayDoctor() {
    print('$id : $name, $age, $salary');
  }
}
