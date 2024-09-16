Feature: Variables creation in karate framework

<Gherkin keyword> <def> <variable_Name> = <value>

  Background: Create and initialize variables
    * def app_name = 'Apple'
    * def page_load_timeout = 20

  Scenario: To create a variable
    * def var_int = 10
    * def var_string = "Karate"
    Then print "Int Variable ->", var_int
    And print "String Variable ->", var_string


