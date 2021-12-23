# User goals/KeyResults

Ruby Version: 3.0.0

Rails Version: 7.0.0

Simple API to create User goals. User can have many goals and one goal can have many key results.

Before test please check pg ```database.yml``` configuration accordingly https://github.com/sajjadmurtaza/user_goals/blob/main/config/database.yml

### Key files

    
    app
    ├── controller
    │      ├── api                             
    │           └── v1                        
    │               ├── goals_controller (Create and index)
    │               └── key_results_controller (Create)
    │
    ├── models                    
    │      ├── user
    |      ├── goal
    |      └── key_result
    |
    ├── services
    │      ├── base (parents class with common methods)
    |      └── create (to create the user goals and check validity) 
    |
    └──  serializer
            ├── created_goal (serializer to handle newly created goal)
            └── goals_list (serializer to handle user goals list)
    

### Workflow - How does it work?

The following diagram show the process/workflow of the application.
    
 
    │    1. POST api/v1/goals request with required params will create a GOAL  │ 
    ├──────────────────────────────────────────────────────────────────────────│  
    │                                                                          │                       
    │    2. GET request api/v1/goals (user_id in params) will return user goals│               
    │───────────────────────────────────────────────────────────────────────── │
    │                                                                          │
    │    3. POST api/v1/key_results (required params) will create a Key result │
    ├───────────────────────────────────────────────────────────────────────── │ 
    

***
**Setup**

* first clone the directory 
                      ```
                      git clone git@github.com:sajjadmurtaza/user_goals.git'
                      ```
 *  ```cd user_goals```

 *  ```bundle install ```
 *  ```rake db:create```
 *  ```rake db:migrate```
 *  ```rake db:seed```

 or

 *  ```rake db:setup```
 
 *  ```rails s ```
 
 Then open Postman or Insomnia or any API Testing Tool to connect with server
 
 * To Create a New Goal
 
    Enter url ```POST http://localhost:3000/api/v1/goals``` and pass parameters as json


    ```
      {
        "goal": {
          "title": "Learn Golang",
          "user_id": 1,
          "start_date": "28-12-2021",
          "end_date": "28-02-2022"
        }
      }
    ```

    and for all requests, make sure that you also sending with following headers values

    ```Content-Type = application/json```
    and
    ```Accept = application/json```

![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/g2.png "MP1 Screenshot")

and request result will be like that

![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/g1.png "MP1 Screenshot")


* To Get User goals
 
    Enter url ```GET http://localhost:3000/api/v1/goals``` and pass parameters as json

    ```
      {
        "goal": {
          "user_id": 4
        }
      }
    ```

![alt text](https://raw.githubusercontent.com/sajjadmurtaza/SchedulyBridge/master/app/assets/images/g3.png "MP1 Screenshot")

* To Create a Key Result
 
    Enter url ```POST http://localhost:3000/api/v1/key_results``` and pass parameters as json

    ```
      {
        "key_result": {
          "title": "Do Something",
          "goal_id": 1
          }
      }
    ```

### Specs

run ``` bundle exe rspec   ``` to run the tests

#### Note
I used following gems for this challenge.

* [pg](https://github.com/ged/ruby-pg) - A PostgreSQL client library for Ruby.
* [rspec-rails](https://github.com/rspec/rspec-rails) - testing framework
* [byebug](https://github.com/deivid-rodriguez/byebug) -  debugger for Ruby