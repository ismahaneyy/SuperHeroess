# README

- deployed site:
    - https://superheroess-ushh.onrender.com

 ## BDD (Behavior Driven Development) 

1. Viewing all heroes
Given I am a user
When I visit the "/heroes" page
Then I should see a list of all heroes in JSON format

2. Viewing a specific hero
Given I am a user
When I visit the "/heroes/:id" page
And the hero with the given id exists
Then I should see the hero's name, super name, and list of powers in JSON format

3. Viewing all powers
Given I am a user
When I visit the "/powers" page
Then I should see a list of all powers in JSON format

4. Viewing a specific power
Given I am a user
When I visit the "/powers/:id" page
And the power with the given id exists
Then I should see the power's name and description in JSON format

5. Updating a power
Given I am a user
When I visit the "/powers/:id" page with a PATCH request
And the power with the given id exists
And the new description is valid
Then I should see the updated power's name and description in JSON format

6. Creating a hero power
Given I am a user
When I visit the "/hero_powers" page with a POST request
And the hero and power with the given ids exist
And the strength is valid
Then I should see the hero's name, super name, and list of powers in JSON format

## Pseudocode 

1. Viewing all heroes
Retrieve all heroes from the database
Render a JSON response with the list of heroes

2. Viewing a specific hero
Retrieve the hero with the given id from the database
If the hero exists, retrieve its associated powers
Render a JSON response with the hero's name, super name, and list of powers
If the hero doesn't exist, render a JSON response with an error message and a 404 status code

3. Viewing all powers
Retrieve all powers from the database
Render a JSON response with the list of powers

4. Viewing a specific power
Retrieve the power with the given id from the database
If the power exists, render a JSON response with its name and description
If the power doesn't exist, render a JSON response with an error message and a 404 status code

5. pdating a power
Retrieve the power with the given id from the database
If the power exists and the new description is valid, update the power's description
If the power exists and the new description is invalid, render a JSON response with an error message and a 422 status code
If the power doesn't exist, render a JSON response with an error message and a 404 status code

6. Creating a hero power
Retrieve the hero and power with the given ids from the database
If the hero and power exist and the strength is valid, create a new HeroPower with the given attributes
If the hero and power don't exist or the strength is invalid, return an error message with appropriate status code.