Bookmarks Manager

A web app that can store web bookmarks in a database as a collection of URL's. we can save a URL that we found useful and add tags to the web pages we found useful.

Using Ruby and sinatra as a framework to build a web app based on model view controller and using postgreSQL as a database.


```
╔════════════╗         .all         ╔════════════╗  SELECT * FROM bookmarks; ╔════════════╗
║            ║--------------------->║            ║-------------------------->║            ║
║ Controller ║ [array of bookmarks] ║  Bookmark  ║      {result object}      ║  Database  ║
║            ║<---------------------║            ║<--------------------------║            ║
╚════════════╝                      ╚════════════╝                           ╚════════════╝
```


the website can meet the following requirements

- show a list of bookmarks
- add a new bookmark
- delete a bookmark
- update bookmarks
- comment on bookmarks
- tag bookmarks into categories
- filter bookmarks by tag

users can manage their bookmarks



built using Behaviour Driven Development (BDD) cycle using Capybara/Ruby/Rspec/Sinatra. application can read and write to and from the database (postgreSQL) and is structured in an MVC style.


to launch the program, run bundle install from the command line and then rackup from the terminal.
