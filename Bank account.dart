import 'dart:io';

void main() {
  var user = Account();
  user.accessAccount();
}
 
class Transaction {
  String type;
  double amount;

  Transaction(this.type,this.amount);

  @override
  String toString() {
    return 'type : $type , amount : $amount';
  }
}

class Account {
  var listOfTransactions = [];
  var balance = 0.0;

  accessAccount(){
    while (true){
    print('''1.send | 2.recive | 3.view transactions | 4.balance | 5.quit''');
      try {
        var userInp = int.parse(stdin.readLineSync()!);
        switch(userInp){
          case 1:
            process('send');
          case 2:
            process('recive');
          case 3:
            print(listOfTransactions);
          case 4:
            print(balance);
          case 5:
            return;
          default:
            print("Invalid input");
        }
      } catch(e) {
        print("Enter a number");
      }
    }
  }
  process(type){
  print("Enter the amount");
  try {
    var amount = double.parse(stdin.readLineSync()!);
    var transaction = Transaction(type, amount);
    listOfTransactions.add(transaction);
    if(type == 'send'){
      balance -= amount;
    }else 
      balance += amount;
  } catch(e) {
    print("Enter a number");
  }
}
}