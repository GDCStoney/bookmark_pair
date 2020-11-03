# Bookmark Manager Challenge Analysis

## User Stories
no formatted user stories given as part of Challenge - given a "specification":
```
You're going to build a bookmark manager.
- A bookmark manager is a website to maintain a collection of bookmarks (URLs).
- You can use it to save a webpage you found useful.
- You can add tags to the webpages you saved to find them later.
- You can browse bookmarks other users have added.
- You can comment on the bookmarks.
```

## Initial User Story identification
### User Story 1
```
A bookmark manager is a website to maintain a collection of bookmarks (URLs).
```
As a user,
so that I can refer to them later,
I would like a website to maintain a collection of URLs (bookmarks)


### User Story 2
```
You can use it to save a webpage you found useful.
```
As a user,
so that I can access it later,
I would like to save a webpage(URL).


### User Story 3
```
You can add tags to the webpages you saved to find them later.
```
As a user,
so that I can add more information about a webpage,
I would like to add 'tags' to the webpage.


### User Story 4
```
You can browse bookmarks other users have added.
```
As a user,
so that I can find new resources,
I would like to browse bookmarks saved by other users


### User Story 5
```
You can comment on the bookmarks.
```
As a user,
so that I can give more value to a bookmark,
I would like to add a comment to the bookmark.

## Assumptions
- This can be a separate website - no need to integrate into the browser interface.
- this is multiuser operation, with the ability to interact on a shared resource of 'bookmark' objects
  - no explicit identification of 'roles' (admin, user, super_user, reviewer, etc)
    - assumption of a flat single role model - 'user'
    - assumption of ability to 'comment', but no other functionality on objects not created by the original user
  - no identification of 'tags' or usage of 'tags' - initial minimal functionality assumption of assign and view only
    - extension opportunity - search / category / ordering by tags
  - no identification of how to present bookmarks (current user, or other users) - initial assumption is present ALL bookmarks
    - extension opportunity - filtering / colour coding / etc
  - no indication of single or multiple comments - initial assumption - single shared editable comment area
    - extension opportunity - separate comment / date ordered / rating / etc.

    
