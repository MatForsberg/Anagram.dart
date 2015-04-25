// Copyright (c) 2015, Mat Forsberg. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:Anagram/Anagram.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  var anagram = new Anagram();
  final parser = new ArgParser()
  ..addFlag('create', negatable: false, abbr: 'c', callback: (create){
    if(create) {
      anagram.SaveKeyedDictionary('C:\\WordsEn.txt','C:\\Anagram\\KeyedWords.txt');
    }
  });
  ArgResults argResults = parser.parse(arguments);
  if(argResults != null) {
    var dictionary = anagram.ReadKeyedDictionary('C:\\Anagram\\KeyedWords.txt');
    argResults.rest.forEach((e) => print(dictionary[anagram.CreateKey(e)]));
  }
}
