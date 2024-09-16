Feature: To validate the GET End point.
#To validate the get end point response.
#
#  Background: Setup the base url
#    Given url 'http://localhost:9191'
#
#  Scenario: To get the data in XML format
#    Given path '/normal/webapi/all'
#    And header Accept = 'application/xml'
#    When method GET
#    Then status 200
#    And match /List/item/jobId contains '1'
#    And match /List/item/jobTitle == 'Software Engg'
#    And match /List/item/experience/experience[1] == '#present'
#
#
#  Scenario: To get the data in XML format and validate using fuzzy matcher
#    Given path '/normal/webapi/all'
#    And header Accept = 'application/xml'
#    When method GET
#    Then status 200
#    And match /List/item/jobId == '#notnull'
#    And match /List/item/jobTitle == '#string'
#    And match /List/item/experience/experience[1] == '#present'
#    And match /List/item/jobTitle == '#string? _.length >= 13'
#
