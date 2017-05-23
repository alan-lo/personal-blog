# Personal Blog

A personal blog with full user authentication and authorization. Signed-in users can add, edit and remove posts.
Users can obtain special ability to like others' posts.
Blog post owners get an notification email every time someone makes a comment. Password reset feature is also implemented.

## Features
 * Add, edit and remove posts.
 * Like posts
 * Leave comments
 * Password reset

## Deployment

* The project is deployed to production on Heroku.
* [Please visit here](https://alan-blog.herokuapp.com/)
* If you want to install the app manually on your local machine, please use see the instructions below.

## Installation & Usage

* Ruby version 2.3.3 and above.

* This web application uses rails framework and PostgreSQL. Please visit their official website for instructions to install.

### Instructions

1. Download the zip file or clone the entire github repository
2. From the terminal , run ```bundle install``` in the project folder to install all required gems.
3. Run ```rails db:create``` to create the databases on PostgreSQL
4. Run ```rails db:migrate``` to create the tables
5. Run ```rails db:seed``` to pre-populate the tables with data on the database
6. Run ```rails server``` to start the app with the default port 3000
7. Type ```localhost:3000/posts``` on your favorite broswer
8. Enjoy blogging.
