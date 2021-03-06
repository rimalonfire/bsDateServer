Feature: convert dates from BS to AD using an API
  As an app-developer in Nepal
  I want to be able to send BS dates to an API endpoint and receive the corresponding AD dates
  So that I have a simple way to convert BS to AD dates, that can be used in other apps

  Scenario Outline: converting a valid BS date
    When a "GET" request is sent to the endpoint "/ad-from-bs/<bs-date>"
    Then the HTTP-response code should be "200"
    And the response content should be "<ad-date>"
    Examples:
      | bs-date    | ad-date    |
      | 2060-04-01 | 2003-07-17 |
      | 2040-01-01 | 1983-04-14 |
      | 2040-12-30 | 1984-04-12 |

  Scenario: converting an invalid BS date
    When a "GET" request is sent to the endpoint "/ad-from-bs/60-13-01"
    Then the HTTP-response code should be "400"
    And the response content should be "not a valid date"

  Scenario Outline: unhandled request types
    When a "<type>" request is sent to the endpoint "/ad-from-bs/60-13-01"
    Then the HTTP-response code should be "400"
    Examples:
      | type |
      | POST |
      | PUT  |
