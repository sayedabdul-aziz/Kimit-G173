// Employee (name , year , salary) and display()

class Person {
  // attr.
  String? name;
  int? age;
  String? gender;

  Person.displayName() {
    print(name);
  }
  Person({required this.name, required this.age, this.gender});
  // Person({required String name, required String gender, required int age}) {
  //   this.name = name;
  //   this.age = age;
  //   this.gender = gender;
  // }
  // methods
  void display() {
    print('$name , $age and $gender');
  }
}
