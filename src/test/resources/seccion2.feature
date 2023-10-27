Feature:
  Scenario: Yo como usuario quiero poder crea, actualizar y eliminar un usuario.

    Given using token in todo.ly
    When send POST request "/api/user.json" with body
    """
    {
        "Email": "ejemplo@gmail.com",
        "FullName": "Moises Valda",
        "Password": "12345678"
    }
    """
    Then response code should be 200
    And the attribute "Email" should be equal to "ejemplo@gmail.com"
    And save "Id" as "$ID_USER" from response
#    And save "Email" as "$EMAIL" from response
#    And save "Password" as "$PASSWORD" from response

    When send DELETE request "/api/authentication/token.json" with body
    """

    """
    Then response code should be 200

    Given using new token in todo.ly

    When send PUT request "/api/user/$ID_USER.json" with body
    """
    {
        "FullName":"Seccion dos",
    }
    """
    Then response code should be 200
    And the attribute "FullName" should be equal to "Seccion dos"

    When send DELETE request "/api/user/$ID_USER.json" with body
    """
    """
    Then response code should be 200
    And the attribute "FullName" should be equal to "Seccion dos"
