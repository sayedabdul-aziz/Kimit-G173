enum Gender { male, female }

class Person {
  String? name;
  int? age;
  int? id;
  Gender? gender;

  Person(this.id, this.name, this.gender, [this.age]);
  void display() {
    print('$id : $name, $age');
  }
}
