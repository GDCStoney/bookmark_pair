# Setup and configuration information for Bookmarks Challenge

[README file](/README.md)
## Database Creation
- install 'psql' - postgresql
  - ``` brew install postgresql ```
- configure to allow automatic startup - if desired
  - ``` brew services start postgresql ```
- initial connection to psql from command line (default database)
  - ``` psql postgres ```
  - create username default database for auto startup / easy psql startup
    - ``` psql=# CREATE DATABASE <username>; ```

- Create 'bookmarks' database
  - ``` psql=# CREATE DATABASE bookmark_manager; ```
- connect to the database
  - ``` psql=# \c bookmark_manager ```
- run the table setup query
  - [01_create_bookmarks_table.sql](/db/migrations/01_create_bookmarks_table.sql)
