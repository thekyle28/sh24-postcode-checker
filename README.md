# README

# Ruby version
ruby 3.0.1p64 (2021-04-05 revision 0fb782ee38) [x86_64-linux]

# Database creation
The database being utilised is using PostgreSQL, ensure you have PostgreSQL 12.8 installed on your system.

* Start the PSQL service:
  `sudo service postgresql start`

* You will also require a user called postgres, normally this user is included by default with the installation of PSQL, incase it is not run:
  `createuser postgres`

* run the following to create the databases required for the application:

  `rake db:setup`

# How to run the test suite
* Run `bin/rails test *`

I unfortunately was unable to see the system tests run successfully as I was developing on Windows, and running the system tests with Selenium whilst using WSL (Windows Subsystem for Linus) proved difficult! Had I had more time I would have setup a docker container to run the system tests in.

Thank you for taking the time to go through this application.
