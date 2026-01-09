import 'dart:io';

class Question {
  String questionText;
  List<String> options = [];
  String crtOption;

  Question(this.questionText, this.options, this.crtOption);

  @override
  String toString() {
    String retString = 'Q. $questionText.\n';
    for (int i=1;i<=options.length;i++){
      retString = retString + '$i. ${options[i-1]}\n';
    }
    return retString;
  }
}

class Trivia {
  var questionList = [];
  int score = 0;

  createQues() {
    print("Enter question text:");
    var questionText = stdin.readLineSync()?? '';
    List<String> options = [];
    print("Enter 3 Options:");
    for (int i = 0; i < 3; i++) {
      var value = stdin.readLineSync()?? '';
      options.add(value);
    }
    print("Enter the correct option:");
    var crtOption;
    while(true){
      crtOption = stdin.readLineSync()?? '';
      if (options.contains(crtOption)){
        break;
      }
      else{
        print("It is not in the options list!");
      }
    }
    var question = Question(questionText, options, crtOption.toLowerCase());
    questionList.add(question);
  }

  testTrivia() {
    score = 0;
    if (questionList.length > 0){
      for (int i = 0; i < questionList.length; i++) {
        var ques = questionList[i];
        print(ques);
        var answer = stdin.readLineSync()?? '';
        if (answer.toLowerCase() == ques.crtOption) {
          score++;
          print("Correct answer!");
        } else {
          print("Wrong answer!");
        }
      }
      print("The score is $score");
    }
    else{
      print("No questions available. Create some questions first");
    }
  }
}

void main() {
  var trivia = Trivia();

  while (true) {
    print("1.Create questions | 2.Test | 3.Quit");
    try {
      var inp = int.parse(stdin.readLineSync()?? '');
      switch (inp) {
        case 1:
          while (true) {
            trivia.createQues();
            print("Add next? (y/n)");
            var inp = stdin.readLineSync()?? '';
            if (inp.toLowerCase() == 'y') {
              continue;
            } else if (inp.toLowerCase() == 'n') {
              break;
            } else {
              print("Invalid input!");
            }
          }
          break;

        case 2:
          trivia.testTrivia();
          break;

        case 3:
          return;

        default:
          print("Invalid input! Enter 1 or 2 or 3");
          break;
          
      }
    } catch (e) {
      print("Invalid input! Enter 1 or 2 or 3");
    }
  }
}
