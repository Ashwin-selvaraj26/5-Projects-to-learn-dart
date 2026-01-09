import 'dart:io';

void main(){
  var wordMap = {};
  var userInp = stdin.readLineSync()!;
  List<String> words = userInp.toLowerCase().split(' ');

  for (String word in words){
    if(wordMap.containsKey(word)){
      wordMap[word]++;
    }
    else{
      wordMap[word] = 1;
    }
  }
  print(wordMap);
}