# Dart OOP Assignment: Kigali Bus Card

**Student Name:** Helen Bokeng Mokonde Mateh  
**Student ID:** 26288  

---

## Assignment Parameters
- **Variables:** `D = 88`, `L = 8`
- **Starting Balance:** 1,880 RWF
- **Standard Bus Fare:** 288 RWF
- **Student Discount:** 18%

---

## Program Output (`main.dart`)


====================================
--- PART 1: Regular BusCard ---
====================================
- Error: name too short
- Owner: Ama | Balance: 1880 RWF
- Owner: Helen Bokeng Mokonde Mateh | Balance: 1880 RWF
- Error: top-up must be 500 to 50000 RWF
- Topped up 2000 RWF
- Paid 288 RWF
- Paid 288 RWF
- Owner: Helen Bokeng Mokonde Mateh | Balance: 3304 RWF

====================================
--- PART 2 & 3: StudentCard ---
====================================
- Student discount: 51 RWF
- Paid 237 RWF
- Owner: Helen Bokeng Mokonde Mateh | Balance: 1643 RWF
- Student card: 18% off

Part 1: Encapsulation & Balance Protection
Question: Why is there no setter for ⁠balance⁠?
Omitting a setter for ⁠balance⁠ protects the integrity of the data through encapsulation. If a public setter existed, any external code could execute ⁠card.balance = 999999⁠ and grant unlimited funds. By keeping ⁠_balance⁠ private and restricting modifications exclusively to the ⁠topUp()⁠ method (which enforces a 500–50,000 RWF limit) and the ⁠pay()⁠ method, the class guarantees that the balance can only change through valid, controlled transactions.

Part 2: Integer Division Operator (⁠~/⁠)
Question: What does ⁠~/⁠ do?
 Standard Division (⁠/⁠): ⁠print(237 * 17 / 100);⁠ outputs ⁠40.29⁠. The ⁠/⁠ operator performs floating-point division and returns a ⁠double⁠ (a number with decimal places).
 Truncating Division (⁠~/⁠): ⁠print(237 * 17 ~/ 100);⁠ outputs ⁠40⁠. The ⁠~/⁠ operator performs integer division, which divides the numbers and truncates (discards) the decimal remainder, returning an ⁠int⁠.

Why it is used here: Rwandan Francs (RWF) are handled as whole numbers in everyday transit fares; fractional amounts of a Franc are not used.

Part 4: Bug table
Bug The line Why it is wrong Your fix
1 String _brand; and int _battery; The fields had no starting value AND MUST BE INITIALIZED BEFORE USED String _brand = ''; and int _battery = 0;
2 SmartPhone(String brand, int battery, String system) { It did not call the parent constructor MEANS that the constructor must correctly initialize the object field Added : super(brand, battery)
3 @override void restart() The parent Phone has no restart method Removed @override
4 p.battery = 100; There was no setter for battery Added a setter that accepts 0 to 100
5 print(p.battery()); battery is a getter, so no () print(p.battery);
Not a bug Why is this line fine?
Phone p = new Phone('Tecno', 50); In Dart, new is optional, so the line is allowed

Part 5: Code Tracing & Prediction
Prediction: Regular ⁠Bag⁠: The first output will be ⁠1⁠. Although ⁠a.items = -5⁠ is executed, the setter rejects negative values (less than ⁠0⁠), leaving the count unchanged at ⁠1⁠.
 ⁠BigBag⁠: The second output will be ⁠5⁠. Each call to ⁠add()⁠ adds ⁠2⁠ items, so two ⁠add()⁠ calls bring the total to ⁠4⁠, and adding ⁠1⁠ more results in ⁠5⁠.

Actual Output
1
5