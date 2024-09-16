Feature: To test the updation of Job entry in the test application
Test the end point PUT /normal/webapi/update

  Background: Create and Initialize base Url
    Given url 'http://localhost:9191'

  Scenario: To update the Job Entry for exiting job in JSON format
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request {  "jobId": '#(id)',"jobTitle": "Software Engg - 2", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId":'#(id)',
        "jobTitle":"Software Engg - 3",
        "jobDescription":"To develop andriod application and Web Application",
        "experience":[
          "Google",
          "Apple",
          "Mobile Iron",
          "Google"
        ],
        "project":[
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          },
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          }
        ]
      }
      """
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
    And print projectArray
#    * assert projectArray[0].length == 3

  Scenario: To update the Job Entry for non-exiting job in JSON format
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((10000) * Math.random());}
    * def id = getRandomValue()
    And request {  "jobId": '#(id)',"jobTitle": "Software Engg - 2", "jobDescription": "To develop andriod application", "experience": [ "Google", "Apple", "Mobile Iron", "Google" ], "project": [ { "projectName": "Movie App", "technology": [ "Kotlin", "SQL Lite","Gradle", "Jenkins" ] } ]}
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId":'#(getRandomValue())',
        "jobTitle":"Software Engg - 3",
        "jobDescription":"To develop andriod application and Web Application",
        "experience":[
          "Google",
          "Apple",
          "Mobile Iron",
          "Google"
        ],
        "project":[
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          },
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          }
        ]
      }
      """
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 404


  Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file

    Given call read('../../createJobEntry.feature')
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId":'125',
        "jobTitle":"Software Engg - 3",
        "jobDescription":"To develop andriod application and Web Application",
        "experience":[
          "Google",
          "Apple",
          "Mobile Iron",
          "Google"
        ],
        "project":[
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          },
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          }
        ]
      }
      """
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == 125)].project")
    And print projectArray
  #    * assert projectArray[0].length == 3


  Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file using shared context

#    Given call read('../../createJobEntry.feature')
    * def postRequest = call read('../../createJobEntry.feature')
    And print "Calling feature ==> ", postRequest.id
    And print "Calling feature ==> ", postRequest.getRandomValue()

    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId":'#(postRequest.id)',
        "jobTitle":"Software Engg - 3",
        "jobDescription":"To develop andriod application and Web Application",
        "experience":[
          "Google",
          "Apple",
          "Mobile Iron",
          "Google"
        ],
        "project":[
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          },
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          }
        ]
      }
      """
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + postRequest.id + ")].project")
    And print projectArray


  Scenario: To update the Job Entry for exiting job in JSON format by calling another feature file with variables

    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("../../createJobEntryWithVariables.feature") { _url:'http://localhost:9191', _path:'/normal/webapi/add', _id:'#(id)' }
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId":'#(id)',
        "jobTitle":"Software Engg - 3",
        "jobDescription":"To develop andriod application and Web Application",
        "experience":[
          "Google",
          "Apple",
          "Mobile Iron",
          "Google"
        ],
        "project":[
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          },
          {
            "projectName":"Movie App",
            "technology":[
              "Kotlin",
              "SQL Lite",
              "Gradle",
              "Jenkins"
            ]
          }
        ]
      }
      """
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response, "$[?(@.jobId == " + id + ")].project")
    And print projectArray
    And match projectArray[0] == '#[2]'