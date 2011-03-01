Feature: As a visitor, I want to search through the scholarship directory with multiple criteria in order to find scholarships that apply to me

  Scenario: A Visitor search without specifying any filter
    Given there is a "1" cycle scholarship named "Bourse des Nations"
    And  there is a "2" cycle scholarship named "Bourse des Lunetiers"
    When I go to the scholarship directory
    And I press "Search"
    Then I should see "Bourse des Nations" in the list of scholarships
    And I should see "Bourse des Lunetiers" in the list of scholarships

  Scenario: A Visitor filters the 1st cycle scholarships
    Given there is a "1" cycle scholarship named "Bourse des Nations"
    And  there is a "2" cycle scholarship named "Bourse des Lunetiers"
    When I go to the scholarship directory
    And I check "cycles[first_cycle]"
    And I press "Search"
    Then I should see "Bourse des Nations" in the list of scholarships
    And I should not see "Bourse des Lunetiers" in the list of scholarships