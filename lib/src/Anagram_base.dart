// Copyright (c) 2015, Mat Forsberg. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Anagram.base;

import 'dart:io';

class Anagram {
  /// Creates the key signature for a word and returns the key
  String CreateKey(String word){
    /// Make a list of characters from the string
    List key = word.toLowerCase().split('');
    /// sort the list into the key signature
    key.sort((x, y)=>x.compareTo(y));
    /// Make a string from the list of sorted characters and return it
    return key.join('');
  }

  /// Create an anagram map (dictionary) from a file with a single word on every line
  Map CreateAnagramMap(String readFile){
    Map dictionary = {};
    File unkeyedDictionaryFile = new File(readFile);
    var words = unkeyedDictionaryFile.readAsLinesSync();
    for(var word in words){
      String signature = CreateKey(word);
      if(dictionary[signature]==null){
        dictionary[signature] = [word];
      }
      else{
        dictionary[signature].add(word);
      }
    }
    return dictionary;
  }

  SaveKeyedDictionary(String readFile, String writeFile) {
    Map dictionary = CreateAnagramMap(readFile);
    File keyedDictionaryFile = new File(writeFile);
    if(!keyedDictionaryFile.existsSync()) {
      keyedDictionaryFile.createSync(recursive: true);
    }
    var f =keyedDictionaryFile.openWrite();
    var keys = dictionary.keys;
    for(var key in keys) {
      f.write(key);
      var values = dictionary[key];
      for (var value in values) {
        f.write(' ' + value);
      }
      f.writeln("\r");
    }
    f.close();
    f.done.then((_) {
      exit(0);
    });
  }

  Map ReadKeyedDictionary(String readFile){
    Map keyedDictionary = {};
    File keyedDictionaryFile = new File(readFile);
    var lines = keyedDictionaryFile.readAsLinesSync();
    for(var line in lines){
      var values = line.split(' ');
      String key = values.removeAt(0);
      values[values.length - 1] = values[values.length - 1].trimRight();
      keyedDictionary[key]= values;
    }
    return keyedDictionary;
  }
}

