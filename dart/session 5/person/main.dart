import 'doctor.dart';
import 'person.dart';
import 'student.dart';

void main(List<String> args) {
  Student s1 = Student(4, 'Ahmed', Gender.male, 65465, 22);

  s1.display();

  Doctor d1 = Doctor(6546, 32, 'Hany', Gender.male, 10000);

  d1.displayDoctor();
}
