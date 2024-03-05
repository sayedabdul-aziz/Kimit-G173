// Employee (name , year , salary) and display()

class Person {
  // attr.
  String? name;
  int? _age;
  String? gender;

  Person.displayName() {
    print(name);
  }
  Person({required this.name, this.gender});
  // Person({required String name, required String gender, required int age}) {
  //   this.name = name;
  //   this.age = age;
  //   this.gender = gender;
  // }

  // methods

  void setAge(int age) {
    if (age > 0) {
      this._age = age;
    } else {
      print('invalid age');
    }
    //
  }

  void display() {
    print('$name , $_age and $gender');
  }
}
