#Feature: To validate the GET End point.
#To validate the get end point response.
#
#  Background: Setup the base url
#    Given url 'http://localhost:9191'
#
#  Scenario: To get the data in JSON format and validate from file
#    Given path '/normal/webapi/all'
#    And header Accept = 'application/json'
#    When method GET
#    Then status 200
#    * def JsonResponse = read('../../JsonResponse.json')
#    And match response == JsonResponse
#    And print "File JSON ->  ", JsonResponse
#
#  Scenario: To get the data in XML format
#    Given path '/normal/webapi/all'
#    And header Accept = 'application/xml'
#    When method GET
#    Then status 200
#    * def XmlResponse = read('../../XmlResponse.xml')
#    And match response == XmlResponse
#    And print "File XML ->  ", XmlResponse

Feature: To validate the GET End response from file
To validate the get end point response from extenal file

  Background: Setup the base url
    Given url 'http://localhost:9191'

  Scenario: To get the data in JSON format and validate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    # Create a variable to store the data from external file
    * def actualResponse = read("../../JsonResponse.json")
    And print "File ==> ", actualResponse
#    And match response == actualResponse

  Scenario: To get the data in xml format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    # Create the variable to read the data from xml file
    * def actualResponse = read("../../XmlResponse.xml")
    And print "Xml Response ==> ", actualResponse
#    And match response == actualResponse