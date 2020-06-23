[![Build Status](https://travis-ci.org/Paprikas/calculate_discount_example.svg?branch=master)](https://travis-ci.org/Paprikas/calculate_discount_example)

# README

Solution for Cart discount calculation.

Chain of Responsibility Pattern like used.

For sake of simplicity I'm using integer over decimal for prices and no users.

Ruby on Rails framework was chosen because of test framework integration by default and to show example close to real world application.

## Setup

Application made in docker. So in order to run in isolation, you'll need to build container

Run build `docker-compose build`

Enter into docker `docker-compose run web bash`

Install gems `bundle`

Run migration `rake db:migrate`

## Test

To run tests enter into docker `docker-compose run web bash`

And run tests `rake test`
