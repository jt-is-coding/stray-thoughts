# Stray Thoughts
Stray Thoughts is a platform designed to assist users Discover and Catalogue games in a single tab.

## Technologies Used
- Ruby version: `3.2.1`
- Rails version: `7.1.3.3`
- Bootstrap 5

## Functionality

## Search
Once a user has created an account and signed in, they can search for games using the search bar at the top of the page. On mobile, they will need to use the Navigation dropdown to go to the search page manually. From there, searching is as easy as inputting a year and seeing what pops up!

![alt text](app/assets/images/search.png)

## Notes
When a user finds a game they're interested in, they can create a Note. Notes will contain all the information given by the API search, in addition to having a Trix-Content form that users can fill out with text, links, and images. Currently images can only be copy/pasted in, rather than using the attachment option on the Trix-Content form.

![alt text](app/assets/images/note.png)

## Entity Data Relationship
![alt text](app/assets/images/erd.png)

## Installation
To install (and run), enter the following in a terminal:
```
bundle install
rails db:create
rails db:migrate
rake sample_data
bin/dev
```

## Troubleshooting
I have occasionally ran into a search resulting in a broken page, but I think that may be fixed now. Due to the nature of being given random results when searching, it's hard to recreate. Currently the Trix-Content form's attachments button does not work properly, as I could not get AWS S3 to link to it. Any users wanting to store images can still do so by simply copy/pasting an image into the Trix-Content form on the edit page.

## Contribution
If you would like to contribute, I think a good point to start at would be adding more search options. For me, searching by year has been nice, but for other users something else may be preferable. As such, if you find yourself wishing you could search another way (perhaps even by title), try implementing it in a branch with initial-issue_number-description format. Once you've got it working, create a pull request and add me as a reviewer so I can take a look!

## Thanks
Thanks to Giant Bomb for having a free API for developers to play around with!
