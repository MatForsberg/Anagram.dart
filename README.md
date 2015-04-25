# Anagram

A library for creating keyed dictionaries, and searching for anagrams in the keyed dictionary
https://github.com/MatForsberg/Anagram.dart/edit/master/README.md#
## Usage

Some simple usage examples:
    
**Creating Keyed File**

      import 'package:Anagram/Anagram.dart';
      
      main(){
        var inputFileLocation = 'C:\\Anagram\\Words.txt'
        var outputFileLocation = 'C:\\Anagram\\KeyedWords.txt'
        anagram.SaveKeyedDictionary(inputFileLocation,outputFileLocation);
      }

    
**Using Keyed File**

      import 'package:Anagram/Anagram.dart';
      
      main(){
      var fileLocation = 'C:\\Anagram\\KeyedWords.txt'
         var dictionary = anagram.ReadKeyedDictionary(fileLocation);
         print(dictionary[anagram.CreateKey('bats')]));
      }



