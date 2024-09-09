Feature: To test the get end point of the application.

  Background: Set up base path
    Given url 'http://localhost:9191'
    And print "======= Background Keyword ========"

  Scenario: To get all the data from application in JSON format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method GET
    Then status 200

  Scenario: To get all the data from application in XML format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method GET
    Then status 200