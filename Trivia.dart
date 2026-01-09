import 'dart:io';

class Question {
  String questionText;
  List<String> options = [];
  String crtOption;

  Question(this.questionText, this.options, this.crtOption);

  @override
  String toString() {
    return '''
Q. $questionText.
Options : $options
''';
  }
}

class Trivia {
  var questionList = [];
  int score = 0;

  createQues() {
    print("Enter question text:");
    var questionText = stdin.readLineSync()!;
    List<String> options = [];
    print("Enter 3 Options:");
    for (int i = 0; i < 3; i++) {
      var value = stdin.readLineSync()!;
      options.add(value);
    }
    print("Enter the correct option:");
    var crtOption = stdin.readLineSync()!;
    var question = Question(questionText, options, crtOption);
    questionList.add(question);
  }

  testTrivia() {
    for (int i = 0; i < questionList.length; i++) {
      print("The score is $score");
      var ques = questionList[i];
      print(ques);
      var answer = stdin.readLineSync();
      if (answer == ques.crtOption) {
        score++;
        print("Correct answer!");
      } else {
        print("Wrong answer!");
      }
    }
  }
}

void main() {
  var trivia = Trivia();

  while (true) {
    print("1.Create questions | 2.Test | 3.quit");
    try {
      var inp = int.parse(stdin.readLineSync()!);
      switch (inp) {
        case 1:
          while (true) {
            trivia.createQues();
            print("Add next? (y/n)");
            var inp = stdin.readLineSync()!;
            if (inp.toLowerCase() == 'y') {
              continue;
            } else if (inp.toLowerCase() == 'n') {
              break;
            } else {
              print("Invalid input!");
            }
          }

        case 2:
          trivia.testTrivia();

        case 3:
          return;
      }
    } catch (e) {
      print("Invalid input! Enter 1 or 2 or 3");
    }
  }
}
