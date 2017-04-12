#Blog Assignment

Updated Requirements 

##Liking

Add the ability for users who are not the owners of blog posts to like blog posts. Show the total number of likes beside the 

like link. Users should be able to remove their after the like a blog post.

Have a separate page for users to list all the blogs they have liked before

[Stretch] Use font-awesome or similar to use heart icon instead of using a text link

##Emailing

Set up mailers so that the blog post owner gets an email every time someone makes a comment

Move the mailer to the background using DelayedJob

[Stretch] Build a mechanism to have daily emails about comments sent instead of getting an email for every comment

-----------------------------------------------------------------------------------------------

User Authentication

User Authentication: Add standard user authentication for your Blog. Make sure your user has a first name, last name, and 
email. Associate records with the user model as per your ERD.

Edit User: Implement the ability to edit the user's first name, last name and email for your blog project. Make it so when the user clicks on his/her name they go to a page where they can edit their information.

Change Password: Implement the ability to change the password for your users on the Blog tool. The page must contain three fields: current password, new password and new password confirmation. The user must enter a correct current password and matching new password and new password confirmation. Make sure that the new password is different from the current password.

##User Authorization

Enforce the following permissions in your Blog application:

Only signed in users can create blog posts or comments

Only the creator of blog posts can edit or delete them

Only the creator of comments or the creator of blogs can delete comments

Have an admin user that can do anything

##Deployment

Deploy your Blog tool to production on Heroku. Get into the habit of deploying frequently. Maybe every week.

Stretch (Completed)

Implement a forgot password feature for your Blog application that works as follows:

In the sign-in page have a link called forgot password? click here

The link above should take the user to a page where they can enter their email

After entering their email and hitting submit the user should technically get an email with a link. Don't worry about sending 

an email now as we haven't learned that yet but make sure that you have a link with a token to reset the password.

When the user visits the page with that link it should show three fields: new password and new password confirmation

To change the password the user must enter matching password

The user is redirected to the sign-in page to sign in with new credentials

[Bonus]: Make the reset password link expire in three days (not implemented)

# Usage

* Ruby version 2.3.3 and above.

This app uses rails framework and PostgreSQL. Please install rails ```gem install rails``` for ruby

```brew install postgresql``` to install PostgreSQL

Once installed, run ```bundle install``` in the project folder to install all required gems.

Run ```rails db:create``` to create the databases on PostgreSQL

Run ```rails db:migrate``` to create the tables

Run ```rails db:seed``` to populate the tables with data on the database

Run ```rails server``` to start the app on the default port 3000

Type ```localhost:3000/posts``` on your broswer
