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



class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor
  // ": super(owner, balance)" builds the parent BusCard first
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // Override showInfo (given)
  @override
  void showInfo() {
    super.showInfo(); // run the parent's showInfo first
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay
  @override
  void pay(int fare) {
    // Step 1: work out the discount using ~/ (integer division)
    int off = fare * _discount ~/ 100;
    
    // Step 2: print the discount
    print('Student discount: $off RWF');
    
    // Step 3: call the PARENT's pay with the reduced fare
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 88, L = 8
  // Starting balance = 1880 RWF, Bus fare = 288 RWF, Discount = 18%

  print('====================================');
  print('--- PART 1: Regular BusCard ---');
  print('====================================');
  
  BusCard card = BusCard('Ama', 1880); 
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5: change the owner to your full name, then call showInfo()
  card.owner = 'Helen Mokonde';
  card.showInfo();

  // TODO 6: top up 100 RWF (must be refused), then top up 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay your bus fare 2 times, then call showInfo()
  card.pay(288);
  card.pay(288);
  card.showInfo();

  print('\n====================================');
  print('--- PART 2 & 3: StudentCard ---');
  print('====================================');

  // TODO 8: create a StudentCard with your name, starting balance and discount
  StudentCard student = StudentCard('Helen Mokonde', 1880, 18);

  // TODO 9: pay your bus fare with the student card, then call showInfo()
  student.pay(288);
  student.showInfo();
}