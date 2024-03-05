import 'person.dart';

class Student extends Person {
  int? grade;

  Student(this.grade, String name, Gender gender, int id, int age)
      : super(id, name, gender, age);

  // Student(this.grade,super.name,super.id,super.age);
  @override
  void display() {
    super.display();
    print('$id : $name, $age,$gender, $grade');
  }
}
