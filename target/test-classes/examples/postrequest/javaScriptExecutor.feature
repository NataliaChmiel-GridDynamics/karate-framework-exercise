Feature: To execute JavaScript function

  Scenario: Execute JS with and without parameter

     * def getIntValue = function() {return 10;}
    Then print "Function value -> ", getIntValue()
    * def getRandomValue = function() {Math.floor((100) * Math.random())}
    Then print "Function random value -> ", getRandomValue()
    * def getStringValue = function(arg1) {return "Hello " + arg1;}
    Then print "Function Value => ", getStringValue("World")

