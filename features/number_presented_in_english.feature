Feature: Numbers can be presented as enlish words

  Scenario Outline: Present as enlish words, the numbers given in the task
    When I present <number> as english number
    Then I should get <name>

    Examples:
      | number | name        |
      | 7      | "seven"     |
      | 42     | "forty-two" |
      | 2001   | "two thousand and one" |
      | 1999   | "nineteen hundred and ninety-nine" |

  Scenario Outline: Present numbers below 20
    When I present <number> as english number
    Then I should get <name>

    Examples:
      | number | name      |
      |  1     |"one"      |
      |  2     |"two"      |
      |  3     |"three"    |
      |  4     |"four"     |
      |  5     |"five"     |
      |  6     |"six"      |
      |  7     |"seven"    |
      |  8     |"eight"    |
      |  9     |"nine"     |
      | 10     |"ten"      |
      | 11     |"eleven"   |
      | 12     |"twelve"   |
      | 13     |"thirteen" |
      | 14     |"fourteen" |
      | 15     |"fifteen"  |
      | 16     |"sixteen"  |
      | 17     |"seventeen"|
      | 18     |"eighteen" |
      | 19     |"nineteen" |
      | 20     |"twenty"   |

  Scenario Outline: Present numbers 21-99
    When I present <number> as english number
    Then I should get <name>

    Examples:
      | number | name          |
      | 21     | "twenty-one"  |
      | 30     | "thirty"      |
      | 40     | "forty"       |
      | 50     | "fifty"       |
      | 60     | "sixty"       |
      | 70     | "seventy"     |
      | 80     | "eighty"      |
      | 90     | "ninety"      |

  Scenario Outline: Present numbers between 100-999
    When I present <number> as english number
    Then I should get <name>
    Examples:
      | number   | name                            |
      | 100      | "hundred"                       |
      | 300      | "three hundred"                 |
      | 512      | "five hundred and twelve"       |
      | 888      | "eight hundred and eighty-eight"|

  Scenario Outline: Present random big numbers
    When I present <number> as english number
    Then I should get <name>
    Examples:
      | number   | name                                        |
      | 1001     | "one thousand and one"                      |
      | 21103    | "twenty-one thousand one hundred and three" |
      | 88888888 | "eighty-eight million eight hundred and eighty-eight thousand eight hundred and eighty-eight"                   |

