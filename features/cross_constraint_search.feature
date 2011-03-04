Feature:
  As a visitor,
  I want to search through the scholarship directory with multiple criteria
  in order to find scholarships that apply to me

  Scenario: Find all the scholarships
    Given the following scholarships exist
    |name|
    |Bourse des Nations|
    |Bourse des Lunetiers|

    When I search all scholarships

    Then I should only see the following scholarships
    |name|
    |Bourse des Nations|
    |Bourse des Nations|

    
  Scenario: Find the scholarships of first cycle
    Given the following scholarships exist for given cycle
    |name|cycle|
    |Bourse des Nations|1|
    |Bourse des Petites Nations|1|
    |Bourse des Lunetiers|2|

    When I search the scholarships of first cycle

    Then I should only see the following scholarships
    |name|
    |Bourse des Nations|
    |Bourse des Petites Nations|