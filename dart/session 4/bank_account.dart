class BankAccount {
  String? name;
  int? _cardNumber;
  double _balance = 0;
  BankAccount(
    this.name,
  );

  void deposite(double amount) {
    this._balance += amount;
  }

  bool withdraw(double amount) {
    if (this._balance >= amount) {
      this._balance -= amount;
      return true;
    } else {
      return false;
    }
  }

  double checkBalance() {
    return this._balance;
  }

  void setCardNumber(int number) {
    this._cardNumber = number;
  }

  set cardNumber(int number) => this._cardNumber = number;

  int? getCardNumber() {
    return this._cardNumber;
  }

  int get cardNumber => this._cardNumber!;
}
