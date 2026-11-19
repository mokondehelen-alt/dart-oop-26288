# Dart OOP Assignment: Kigali Bus Card

**Name:** Helen Bokeng Mokonde Mateh
**Student ID:** 26288

## My numbers
- D = 88, L = 8
- Starting balance = 1880 RWF
- Bus fare = 288 RWF
- Student discount = 18%

## Output of main.dart

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
```

## Part 1: Why no setter for balance?
It is a good idea to not have a setter for the balance to protect the data. If there was a setter, anyone could do `card.balance = 999999` and give themselves unlimited money. By making the balance private and only allowing it to change through the `topUp()` (which has a 500-50000 limit) and `pay()` methods, we ensure the card cannot be exploited. This is called encapsulation.

## Part 2: What does ~/ do?
- `print(237 * 17 / 100);` outputs `40.29`. The `/` operator performs normal division and returns a `double` (a number with decimals).
- `print(237 * 17 ~/ 100);` outputs `40`. The `~/` operator performs integer division, which divides the numbers and truncates (removes) the decimal part, returning an `int`. 
We use `~/` here because Rwandan Francs (RWF) are whole numbers; you cannot have a fraction of a Franc. 

## Part 4: Bug table 

| Bug | The line | Why it is wrong | Your fix |
| :--- | :--- | :--- | :--- |
| 1 | `String _brand;` and `int _battery;` | The fields had no starting value AND MUST BE INITIALIZE BEFORE USED | `String _brand = '';` and `int _battery = 0;` |
| 2 | `SmartPhone(String brand, int battery, String system) {` | It did not call the parent constructor MEANS that the constructor must correctly initialized the object field | Added `: super(brand, battery)` |
| 3 | `@override void restart()` | The parent Phone has no restart method | Removed `@override` |
| 4 | `p.battery = 100;` | There was no setter for battery | Added a setter that accepts 0 to 100 |
| 5 | `print(p.battery());` | battery is a getter, so no () | `print(p.battery);` |

| Not a bug | Why is this line fine? |
| :--- | :--- |
| `Phone p = new Phone('Tecno', 50);` | In Dart, new is optional, so the line is allowed |

## Part 5
**My prediction:** 
For the regular Bag, the first print will be `1`. Even though `a.items = -5` is called, the setter rejects it because it's less than 0. For the BigBag, the second print will be `5`. Each `add()` adds 2, so two `add()` calls make it 4. Then adding 1 makes it 5.

**Real output:** 
1
5

**Was I right?** 
Yes, my prediction was correct! The setter protected the value from going negative, and the `super.add()` correctly ran twice per call.