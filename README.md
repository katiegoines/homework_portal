# Science Reporter

![Science Reporter](https://i.imgur.com/j9hNaB5.png)

This app is an assignment submitting portal, where students can draft and submit summary reports of articles weekly. The app is currently built  specifically for the needs of one teacher, however the intention is to continue building this out so it has a more robust suite of features and capabilities for wider use among educators and students. 

[Check it out](https://science-reporter.herokuapp.com/).



### Technology

- Ruby on Rails (Ruby version 2.4.1, Rails version 5.1.4)
- Postgresql
- Bcrpyt (ruby gem for the encryption of passwords)
- Bootstrap (version 4.0)
- HTML
- CSS/SASS



### Approach

Initial planning for this app included creating a basic wireframe for overall app layout, followed by the creation of **user stories** using [Trello](https://trello.com/b/h4OaN3eV/project-2).



### Installation/Startup Instructions

- Download the repository from Github to a local directory
- Open up the project directory in terminal and run  `bundle install` to install any gems needed
- Start Postgres local server
- In terminal, run `rake db:migrate` to migrate the app's existing tables on Postgresql
- In terminal, run `rails server` to start a local server so you can view the application locally
- In the address bar of your browser, go to localhost:3000
- You have now launched the app locally. Create accounts and assignments as you wish



### Unresolved Issues

When you're logged in as a teacher and in the assignments index, you are able to view reports by student, however the intention was to also be able to view by report. Additional work is required to get this functional.

There is currently no one assigned as an Admin, who can own the portal and reset the teacher code when necessary. 

Students do not currently belong to a teacher or class period, so all submitted reports are accessible by all teachers, which is great for sharing information, but not for grading. In the future, both will be incorporated.



### Future Features and Functionality

Additional features and functionality that are intended to be built into this app in the future are included on the Icebox list on [Trello](https://trello.com/b/h4OaN3eV/project-2), which includes but is not limited to:

- Additional models to be built to separate students by class and teacher.
- Students will be able to decide whether they want their reports to be shared with other students, or just with their teacher.
- Students will be able to check whether a report on a link they have chosen is already in the database (and restrict links that have already been submitted) prior to reaching the "New Report" form.
- Revise styling, including fixing header to the top of the page.



### Acknowledgements

- Google Fonts [[1]](https://fonts.google.com/specimen/Pangolin) 
- Background Image [[1]](http://knowscience.org/wp-content/uploads/2014/01/cells-under-a-microscope.jpg)
- Color scheme [[1]](https://designschool.canva.com/blog/website-color-schemes/)



### Technical Requirements

- Two models: User and Assignment (ERD included in [Trello](https://trello.com/b/h4OaN3eV/project-2))
- Sign up/log in functionality with authentication - users also have restricted access based on their user_type
- Complete RESTful routes for both models
- Full CRUD for both models, with restrictions
- Semantically clean HTML and CSS, with the exception of Jumbotron, which may be overused and could have been replaced with custom CSS
- Deployed online via Heroku