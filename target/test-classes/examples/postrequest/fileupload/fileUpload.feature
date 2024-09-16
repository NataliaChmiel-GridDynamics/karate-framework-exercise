Feature: To upload the file using Karate framework


  Background: Base URL initialization
    Given url 'http://localhost:9191'


  Scenario: Uploading file using Karate framework
    Given path '/normal/webapi/upload'
    And multipart file file = { read:'FileToUpload.txt', fileName: 'FileToUpload.txt', ContentType: 'multipart/form-data'}
    When method POST
    Then status 200
    And print response

  Scenario: Uploading file with JSON data using Karate framework
    Given path '/normal/webapi/upload'
    * def fileLocation = '../data/jobEntry.json'
    And multipart file file = { read:'#(fileLocation)', filename:'jobEntry.json', ContentType:'multipart/form-data'  }
    When method POST
    Then status 200
    And print response
    And match response.message contains 'jobEntry.json'