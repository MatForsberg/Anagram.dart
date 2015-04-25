// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library Anagram.test;

import 'package:unittest/unittest.dart';
import 'package:Anagram/Anagram.dart';

main() {
  group('A group of tests', () {
    Anagram anagram;

    setUp(() {
      anagram = new Anagram();
    });

    test('First Test', () {
      expect(anagram.CreateKey(''), '');
    });
    test('Second Test', () {
      expect(anagram.CreateKey('a'), 'a');
    });
    test('Third Test', () {
      expect(anagram.CreateKey('ba'), 'ab');
    });
  });
}
