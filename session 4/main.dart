import 'dart:io';

import 'bank_account.dart';

void main() {
  BankAccount account1 = BankAccount('Ali Samy');
  account1.setCardNumber(1655645654);

  while (true) {
    print(
        'Enter No of Your Operation\n1) Deposite\n2) Withdraw\n3) Check Balance\n4) exit');
    int ope = int.parse(stdin.readLineSync()!);
    switch (ope) {
      case 1:
        print('Enter your amount:');
        double amount = double.parse(stdin.readLineSync()!);
        account1.deposite(amount);
        print(
            'Deposite Successfully, and Your Balance is : ${account1.checkBalance()}');
        break;
      case 2:
        print('Enter your amount:');
        double amount = double.parse(stdin.readLineSync()!);
        bool isDone = account1.withdraw(amount);
        if (isDone) {
          print(
              'Withdraw Successfully, and Your Balance is : ${account1.checkBalance()}');
        } else {
          print('Withdraw not Successfully, Plz try again');
        }
        break;
      case 3:
        print('Your Balance is : ${account1.checkBalance()}');
        break;

      default:
        print('Invalid Operation, PLz try again');
    }

    // ---------------
    print('Do you wanna to do anything ? (Yes/No)');
    String action = stdin.readLineSync()!;
    if (action.toLowerCase() == 'no') {
      print('Thanks, ${account1.name}');
      break;
    }
  }
}
