@Essay1
Feature: Automation Test for jsonplaceholder end point

@IntegerDataTypeChecking
Scenario Outline: Check whether the given data type is Integer
Given I search the id "1"
Then I should get response "200"
Then I check whether the "<attribute>" is Integer
Examples:
| attribute |
| userId |
| id |

@StringDataTypeChecking
Scenario Outline: Check whether the given data type is String
Given I search the id "1"
Then I should get response "200"
Then I check whether the "<attribute>" is String
Examples:
| attribute |
| title |
| body |

@PostCorrectResponse
Scenario: Checking whether the response match with the input
Given I send new post for create with title "recommendation", body "motorcycle" and userId "12"

