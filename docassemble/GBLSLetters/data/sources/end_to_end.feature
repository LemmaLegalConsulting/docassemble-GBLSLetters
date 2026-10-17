# Seeded with ALDashboard static fixture generator; reviewed against interview YAML.
@e2e
Feature: Complete GBLSLetters

  Scenario: Prepare a no-contact letter without a completed intake
    Given I start the interview at "main.yml"
    And the maximum seconds for each step is 120
    When I get to "download documents" with this data:
      | var | value |
      | clients[0].name.first | Alex |
      | clients[0].name.last | Example |
      | clients[0].address.address | 123 Main Street |
      | clients[0].address.city | Boston |
      | clients[0].address.state | MA |
      | clients[0].address.zip | 02108 |
      | clients[0].address.country | US |
      | attorneys[0].name.first | Casey |
      | attorneys[0].name.last | Counsel |
      | attorneys[0].address.address | 456 Main Street |
      | attorneys[0].address.city | Boston |
      | attorneys[0].address.state | MA |
      | attorneys[0].address.zip | 02108 |
      | unit | Consumer Rights Unit |
      | doc_list['No Contact Letter'] | True |
      | clients[0].phone_number | 6175550100 |
      | clients[0].email | alex@example.com |
      | attorneys[0].phone_number | 6175550123 |
      | attorneys[0].email | casey@example.com |
      | intake_complete | False |
      | attempted_contact | I called twice and sent a letter last week. |
      | final_contact_date | today + 14 |
      | signature_date | today |
    Then the question id should be "download documents"
    And I should see the phrase "All done!"
    And I download "No_Contact_Letter.pdf"
