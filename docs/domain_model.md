# Domain Model - Bookmark Challenge

## Minimum Functionality Solution
- single user role - no hierarchy
- single comment area
- no user maintenance
- no browser maintenance, above comment edit
- user id is email
- no filter / sort / categorisation / on browse

### Roles
- creator user

### Objects
- bookmark - URL - tags, comment etc
  - possible object - tag
  - possible object - comment
- User - persistent, name / email

### Methods
- Bookmark
  - create / initialise
  - add tag
  - add comment
  - update

- User
  - create / sign up
  - password

### Interface
- functionality 
  - sign in
  - browse
  - add bookmark
  - add tags
  - add comment
    - present existing as part of add function
