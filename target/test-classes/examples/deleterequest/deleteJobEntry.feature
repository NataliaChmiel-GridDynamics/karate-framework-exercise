Feature: To test the delete end point

  Background: Create and Initialize base Url
    Given url 'http://localhost:9191'

  Scenario: To delete the job entry from application using job id

    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def creatJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9191',_path:'/normal/webapi/add',_id:'#(createJobId)'}

    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept:'application/json'}
    When method delete
    Then status 200

    Given path '/normal/webapi/find'
    And params {id:'#(createJobId)',jobTitle:'Software Engg - 2'}
    And header Accept = 'application/json'
    When method get
    Then status 404

  Scenario: To delete the job entry from application using job id and delete the job entry twice

    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def creatJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9191',_path:'/normal/webapi/add',_id:'#(createJobId)'}

    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept:'application/json'}
    When method delete
    Then status 200

    Given path '/normal/webapi/remove/' + createJobId
    And headers {Accept:'application/json'}
    When method delete
    Then status 404

  Scenario: To demo request chaining

    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def creatJob = call read("../../createJobEntryWithVariables.feature") {_url:'http://localhost:9191',_path:'/normal/webapi/add',_id:'#(createJobId)'}
    * def jobId = creatJob.responseJobId
    * def jobTitle = creatJob.responseJobTitle

    * def jobDes = 'To develop andriod application and web application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)',jobDescription:'#(jobDes)'}
    And header Accept = 'application/json'
    And request {}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle

    Given path '/normal/webapi/find'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)'}
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.jobDescription == jobDes