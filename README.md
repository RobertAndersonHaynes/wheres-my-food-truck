# README

[![Build Status](https://codeship.com/projects/cb2de510-14c2-0136-2a24-523d00c7e7fe/status?branch=master)
[![Code Climate](https://codeclimate.com/github/RobertAndersonHaynes/wheres-my-food-truck/badges/gpa.svg)](https://codeclimate.com/github/RobertAndersonHaynes/wheres-my-food-truck)
[![Coverage Status](https://coveralls.io/repos/github/RobertAndersonHaynes/wheres-my-food-truck/badge.svg?branch=master)](https://coveralls.io/github/RobertAndersonHaynes/wheres-my-food-truck?branch=master)

Getting Started
This project is a Ruby on Rails application with a React.js front end.

Prerequisites
In order to run this application locally, you must at least have Ruby 2.3.3, Rails 5.1.0, node 4.0.0, and npm 5.6.0 installed.

$ ruby -v
=> ruby 2.3.3
$ rails -v
=> Rails 5.0.6
$ node -v
=> v9.4.0
$ npm -v
=> 5.6.0
Installing
To install all your gem and npm dependencies, run the following commands:

$ bundle
$ npm install
Setting up
In order to get the application running in a development server, you will need to configure the database on your local machine.

Create your database from the config/database.yml file:

$ rake db:create
Run the migrations located in the db/migrate folder to setup your schema with the following command:

$ rake db:migrate
You should be able to open up your Rails console and have access to your Rails models.

Running the development server
In order to run the Rails app in a development server, run the following command in your terminal:

$ rails s
Then, in a separate terminal window, run the following command to start the webpack server:

$ npm start
Running the tests
Capybara and RSpec are used to test the Rails application, while Jasmine and Enzyme are used to test the React front end.

To run the Rails spec tests, use the following commands:

$ rake db:test:prepare
$ rake
To execute the enzyme tests, run the following command in a separate terminal window:

$ npm test
Deployment
This application is deployed using Heroku using these instructions: https://devcenter.heroku.com/articles/git

Contributing
Feel free to contact us if you feel like contributing!

License
This project is licensed under the MIT License - see the This project is licensed under the MIT License - see the LICENSE.md file for details file for details

wheres-my-food-truck
