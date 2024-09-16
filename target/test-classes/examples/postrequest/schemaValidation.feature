Feature: Validate the JSON schema

  Background: Create and initialize base Url
    Given url 'http://localhost:9191'


  Scenario: To create Job entry in JSON format
    Given path '/normal/webapi/add'
    * def bodyJson = read('data/jobEntry.json')
    And request bodyJson
    And headers {Accept : 'application/json', ContentType : 'application/json'}
    When method POST
    And status 201
    And match response ==
      """
      {
        "jobId": '#number',
        "jobTitle": '#string',
        "jobDescription": '#string',
        "experience": '#[] #string',
        "project": '#[] #object'
      }
      """
