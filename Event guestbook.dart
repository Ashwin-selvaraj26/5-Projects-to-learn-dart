import 'dart:io';

void main(){
  print("Type 'q' to quit");
  Set guestBook = {};
  while(true){    
    var userInp = stdin.readLineSync()!;

    if (userInp == "q"){
      return;
    }

    if (guestBook.add(userInp.toLowerCase())){
      print('welcome');
    }
    else{
      print('You are already in the book');
    }
  }
}