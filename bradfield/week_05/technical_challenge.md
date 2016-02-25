# Alphasights Technical Challenge

Using Ruby on Rails we would like you to create a simple expert search tool. The application should fulfill the requirements below. The source code must be placed in a public repo on GitHub. The application should be deployable on Heroku.

* I enter a name and a personal website address and a member is created.
* When a member is created, all the heading (h1-h3) values are pulled in from the website to that members profile.
* The website url is shortened (e.g. using http://goo.gl)
* After the member has been added, I can define their friendships with other existing members. Friendships are bi-directional i.e. If David is a friend of Oliver, Oliver is always a friend of David as well.
* The interface should list all members with their name, short url and the number of friends e.g. Alan [http://goo.gl/3io1P](http://goo.gl/3io1P) (3)

* Viewing an actual member should display the name, website URL, shortening, website headings, and links to their friends' pages.

* Now, looking at Alan's profile, I want to find experts in the application who write about a certain topic and are not already friends of Alan.

* Results should show the path of introduction from Alan to the expert e.g. Alan wants to get introduced to someone who writes about 'Dog breeding'. Claudia's website has a heading tag "Dog breeding in Ukraine". Bart knows Alan and Claudia. An example search result would be Alan -> Bart -> Claudia ("Dog breeding in Ukraine")

* Optional: prefering h1 over h2 and shorter introduction paths when ordering results.

* Bonus points for not using Twitter Bootstrap or any other CSS framework (We want to see how you structure your CSS).

We encourage you to use gems and libraries for everything except the search, where we want to see your algorithm. We are looking for a simple, clean, elegant design, tests and all round understanding of the full stack e.g. Ruby, Rails, CSS (or SASS), HTML (or HAML), JavaScript (or CoffeeScript). 
