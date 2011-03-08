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
    |Bourse des Lunetiers|

    
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

  Scenario: Find the scholarship of 1st cycle and for Aboriginal people
    Given the following scholarships exist for given cycle and type
    |name|cycle|type|
    |Bourse des Première Nations|1|aboriginal|
    |Bourse des Petites Nations|1|handicap|
    |Bourse des Lunetiers|2|artisan|

    When I search for the scholarships for Aboriginal people of the 1st cycle
    Then I should only see the following scholarships
    |name|
    |Bourse des Première Nations|

  Scenario: Landing on the homepage displays all scholarships by default
    Given the following scholarships exist for given cycle and type
    |name|cycle|type|
    |Bourse des Première Nations|1|aboriginal|
    |Bourse des Petites Nations|1|handicap|
    |Bourse des Lunetiers|2|artisan|

    When I go to the scholarship directory
    Then I should only see the following scholarships
    |name|
    |Bourse des Première Nations|
    |Bourse des Petites Nations|
    |Bourse des Lunetiers|

  Scenario: Landing on the homepage displays all scholarships by default
    Given the following scholarships exist for given cycle and type
    |name|cycle|type|
    |Bourse des Première Nations|1|aboriginal|
    |Bourse des Petites Nations|1|handicap|
    |Bourse des Lunetiers|2|artisan|

    When I go to the homepage 
    Then I should only see the following scholarships
    |name|
    |Bourse des Première Nations|
    |Bourse des Petites Nations|
    |Bourse des Lunetiers|

