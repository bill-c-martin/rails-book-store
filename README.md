##Introduction

Depot is an online book store that was built by following the book "Agile Web Development with Rails, Fourth Edition". 

It was a follow-along practice project for learning Ruby/Rails concepts, some of which are the optional enhancements/exercises at the end of each section in the book, and the rest are my own enhancements which I did to further reinforce knowledge learned in the book and online.

## Key Concepts

* Cookie-backed sessions
* HTTP authentication
* AJAX
* Active Record-based forms
* Caching
* Migrations
* Unit & system testing
* Email Sending
* Internationalization
* Capistrano deployments
* General Rails best practices

## Software/Library Stack

* Ruby 2.2.4
* Rails 3.2.22
* Bundler/RubyGems
* SQLite/MySQL
* Sass/SCSS
* JavaScript
* jQuery
* CoffeeScript
* Phusion Passenger
* Apache/WEBRick

## Final Coding & Testing Stats

This project ended up with 1400 lines of code written, half of which were automated tests. Not bad!

    $ rake stats
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Name                 | Lines |   LOC | Classes | Methods | M/C | LOC/M |
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Controllers          |   566 |   417 |       9 |      46 |   5 |     7 |
    | Helpers              |    32 |    31 |       0 |       3 |   0 |     8 |
    | Models               |    97 |    81 |       6 |       6 |   1 |    11 |
    | Libraries            |     0 |     0 |       0 |       0 |   0 |     0 |
    | Integration tests    |    65 |    43 |       1 |       0 |   0 |     0 |
    | Functional tests     |   406 |   328 |       9 |       0 |   0 |     0 |
    | Unit tests           |   234 |   177 |      14 |       2 |   0 |    86 |
    +----------------------+-------+-------+---------+---------+-----+-------+
    | Total                |  1400 |  1077 |      39 |      57 |   1 |    16 |
    +----------------------+-------+-------+---------+---------+-----+-------+
      Code LOC: 529     Test LOC: 548     Code to Test Ratio: 1:1.0
