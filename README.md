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

5. Updating a power
Retrieve the power with the given id from the database
If the power exists and the new description is valid, update the power's description
If the power exists and the new description is invalid, render a JSON response with an error message and a 422 status code
If the power doesn't exist, render a JSON response with an error message and a 404 status code

6. Creating a hero power
Retrieve the hero and power with the given ids from the database
If the hero and power exist and the strength is valid, create a new HeroPower with the given attributes
If the hero and power don't exist or the strength is invalid, return an error message with appropriate status code.


## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
To run this project, you will need:

Ruby 2.7.4
Rails 6.1.4
Postgres


### Installing
- Clone the repository:

    - git clone https://github.com/ismahaneyy/SuperHeroess

- Navigate into the project directory:

    - cd Superheroes

- Install dependencies:

    - bundle install

- Set up the database:

    - rails db:create
    - rails db:migrate
    - rails db:seed
- Start the server:

    - rails s

- The API will be available at http://localhost:3000.
- The deployed link is:
     [https://superheroess-ushh.onrender.com]

- Test the endpoints using a tool like Postman or cURL.

#### Endpoints

- GET /heroes
Returns a list of all heroes in the database.

Response

200 OK on success

[
  {
    "id": 1,
    "name": "Kamala Khan",
    "super_name": "Ms. Marvel"
  },
  {
    "id": 2,
    "name": "Doreen Green",
    "super_name": "Squirrel Girl"
  },
  {
    "id": 3,
    "name": "Gwen Stacy",
    "super_name": "Spider-Gwen"
  }
]


- GET /heroes/:id
Returns the hero with the specified ID.

Response

200 OK on success
404 Not Found if hero not found

{
  "id": 1,
  "name": "Kamala Khan",
  "super_name": "Ms. Marvel",
  "powers": [
    {
      "id": 1,
      "name": "super strength",
      "description": "gives the wielder super-human strengths"
    },
    {
      "id": 2,
      "name": "flight",
      "description": "gives the wielder the ability to fly through the skies at supersonic speed"
    }
  ]
}

{
  "error": "Hero not found"
}


- GET /powers
Returns a list of all powers in the database.

Response

200 OK on success

[
  {
    "id": 1,
    "name": "super strength",
    "description": "gives the wielder super-human strengths"
  },
  {
    "id": 2,
    "name": "flight",
    "description": "gives the wielder the ability to fly through the skies at supersonic speed"
  }
]


- GET /powers/:id
Returns the power with the specified ID.

Response

200 OK on success
404 Not Found if power not found

{
  "id": 1,
  "name": "super strength",
  "description": "gives the wielder super-human strengths"
}

{
  "error": "Power not found"
}


- PATCH /powers/:id
Updates the power with the specified ID.

Request Body

    {
        "description": "Updated description"
    }

Response

200 OK on success
404 Not Found if power not found
422 Unprocessable Entity if validation fails

{
  "id": 1,
  "name": "super strength",
  "description": "Updated description"
}

{
  "error": "Power not found"
}

{
  "errors": ["Description can't be blank"]
}


- POST /hero_powers
Creates a new HeroPower that is associated with an existing Power and Hero.

Request Body

{
  "strength": "Average",
  "power_id": 1,
  "hero_id": 3
}


Response

201 Created on success
422 Unprocessable Entity if validation fails

{
  "id": 1,
  "name": "Kamala Khan",
  "super_name": "Ms. Marvel",
  "hero_powers": [
    {
      "id": 1,
      "strength": "Average",
      "power_id": 1,
      "hero_id": 3
    }
  ]
}


### Author:

[Ismahan Abdirizak] (https://github.com/ismahaneyy)

### License

This project is licensed under the MIT License