import 'package:flutter_custom_textfield/features/number_words/utils/number_to_words_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'GIVEN invalid value, '
    'WHEN tried to convert to words, '
    'THEN it should throw AssertionError',
    () {
      expect(
        () => 'abc'.numberToWords,
        throwsAssertionError,
        reason: 'should not accept alphabets',
      );
      expect(
        () => '0.1'.numberToWords,
        throwsAssertionError,
        reason: 'should not accept decimal',
      );
    },
  );

  test(
    'GIVEN value of units, '
    'WHEN converted to words, '
    'THEN it should return in unit words',
    () {
      expect(
        '0'.numberToWords,
        equals('zero'),
        reason: 'should be zero',
      );
      expect(
        '1'.numberToWords,
        equals('one'),
        reason: 'should be one',
      );
      expect(
        '2'.numberToWords,
        equals('two'),
        reason: 'should be two',
      );
      expect(
        '3'.numberToWords,
        equals('three'),
        reason: 'should be three',
      );
      expect(
        '4'.numberToWords,
        equals('four'),
        reason: 'should be four',
      );
      expect(
        '5'.numberToWords,
        equals('five'),
        reason: 'should be five',
      );
      expect(
        '6'.numberToWords,
        equals('six'),
        reason: 'should be six',
      );
      expect(
        '7'.numberToWords,
        equals('seven'),
        reason: 'should be seven',
      );
      expect(
        '8'.numberToWords,
        equals('eight'),
        reason: 'should be eight',
      );
      expect(
        '9'.numberToWords,
        equals('nine'),
        reason: 'should be nine',
      );
    },
  );

  test(
    'GIVEN value of tens less than 20, '
    'WHEN converted to words, '
    'THEN it should return in tens words',
    () {
      expect(
        '10'.numberToWords,
        equals('ten'),
        reason: 'should be ten',
      );
      expect(
        '11'.numberToWords,
        equals('eleven'),
        reason: 'should be eleven',
      );
      expect(
        '12'.numberToWords,
        equals('twelve'),
        reason: 'should be twelve',
      );
      expect(
        '13'.numberToWords,
        equals('thirteen'),
        reason: 'should be thirteen',
      );
      expect(
        '14'.numberToWords,
        equals('fourteen'),
        reason: 'should be fourteen',
      );
      expect(
        '15'.numberToWords,
        equals('fifteen'),
        reason: 'should be fifteen',
      );
      expect(
        '18'.numberToWords,
        equals('eighteen'),
        reason: 'should be eighteen',
      );
      expect(
        '19'.numberToWords,
        equals('nineteen'),
        reason: 'should be nineteen',
      );
    },
  );

  test(
    'GIVEN value of tens more than 20, '
    'WHEN converted to words, '
    'THEN it should return in tens words',
    () {
      expect(
        '20'.numberToWords,
        equals('twenty'),
        reason: 'should be twenty',
      );
      expect(
        '21'.numberToWords,
        equals('twenty-one'),
        reason: 'should be twenty-one',
      );
      expect(
        '30'.numberToWords,
        equals('thirty'),
        reason: 'should be thirty',
      );
      expect(
        '31'.numberToWords,
        equals('thirty-one'),
        reason: 'should be thirty-one',
      );
      expect(
        '40'.numberToWords,
        equals('forty'),
        reason: 'should be forty',
      );
      expect(
        '41'.numberToWords,
        equals('forty-one'),
        reason: 'should be forty-one',
      );
      expect(
        '50'.numberToWords,
        equals('fifty'),
        reason: 'should be fifty',
      );
      expect(
        '51'.numberToWords,
        equals('fifty-one'),
        reason: 'should be fifty-one',
      );
      expect(
        '60'.numberToWords,
        equals('sixty'),
        reason: 'should be sixty',
      );
      expect(
        '61'.numberToWords,
        equals('sixty-one'),
        reason: 'should be sixty-one',
      );
      expect(
        '70'.numberToWords,
        equals('seventy'),
        reason: 'should be seventy',
      );
      expect(
        '71'.numberToWords,
        equals('seventy-one'),
        reason: 'should be seventy-one',
      );
      expect(
        '80'.numberToWords,
        equals('eighty'),
        reason: 'should be eighty',
      );
      expect(
        '81'.numberToWords,
        equals('eighty-one'),
        reason: 'should be eighty-one',
      );
      expect(
        '90'.numberToWords,
        equals('ninety'),
        reason: 'should be ninety',
      );
      expect(
        '91'.numberToWords,
        equals('ninety-one'),
        reason: 'should be ninety-one',
      );
    },
  );

  test(
    'GIVEN value of more than 99, '
    'WHEN converted to words, '
    'THEN it should return in words according to its digits',
    () {
      expect(
        '100'.numberToWords,
        equals('one hundred'),
        reason: 'should be one hundred',
      );
      expect(
        '101'.numberToWords,
        equals('one hundred one'),
        reason: 'should be one hundred one',
      );
      expect(
        '111'.numberToWords,
        equals('one hundred eleven'),
        reason: 'should be one hundred eleven',
      );
      expect(
        '121'.numberToWords,
        equals('one hundred twenty-one'),
        reason: 'should be one hundred twenty-one',
      );
      expect(
        '200'.numberToWords,
        equals('two hundred'),
        reason: 'should be two hundred',
      );
      expect(
        '9991'.numberToWords,
        equals('nine thousand nine hundred ninety-one'),
        reason: 'should be nine thousand nine hundred ninety-one',
      );
      expect(
        '1109991'.numberToWords,
        equals('one million one hundred nine thousand nine hundred ninety-one'),
        reason: 'should be one million one hundred '
            'nine thousand nine hundred ninety-one',
      );
      expect(
        '1201109991'.numberToWords,
        equals(
          'one billion two hundred one million one hundred nine thousand '
          'nine hundred ninety-one',
        ),
        reason: 'should be one billion two hundred one million one hundred '
            'nine thousand nine hundred ninety-one',
      );
      expect(
        '5371201109991'.numberToWords,
        equals(
          'five trillion three hundred seventy-one billion two hundred one '
          'million one hundred nine thousand nine hundred ninety-one',
        ),
        reason: 'should be five trillion three hundred seventy-one billion '
            'two hundred one million one hundred nine thousand nine hundred '
            'ninety-one',
      );
    },
  );
}
