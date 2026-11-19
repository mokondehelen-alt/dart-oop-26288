class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor (given)
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // Getter for owner (given)
  String get owner {
    return _owner;
  }

  // TODO 1: getter for balance
  int get balance {
    return _balance;
  }

  // Setter for owner, with a rule (given)
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // Method (given)
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: topUp
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: pay
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

void main() {
  BusCard card = BusCard('Ama', 1880);
  card.owner = 'Al';         // Should fail
  card.showInfo();
  card.topUp(100);           // Should fail
  card.topUp(2000);          // Should work
  card.pay(288);             // Should work
  card.pay(288);             // Should work
  card.showInfo();
}