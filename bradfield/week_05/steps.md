* form that asks for user name and personal website 
* controller action that produces the form view
* controller action that takes user name and personal website, validates(?) the info, and persists(?) it
* function takes the website url as the input and returns the h1-h3 values from the website using a scraper 

# examples
[[hello, world], [we, are, h2], [we, are, h3]]
{h1: [hello, world], h2: [we, are, h2], h3: [we, are, h3]} 
[{h1: hello}, {h2: we}, {h1: world}, ...]
## winner
[[h1, hello], [h2, we], [h1, world]]

* function that takes the url and shortens it using the http://goo.gl API
* form that asks for beginning or killing friendships 

Your name: 
New friend's name: (dropdown menu)

Your name: 
Ex friend's name: (dropdown menu)

* index view displays all names, short urls, and numbers of friends 

* show view displays one member's name, short url, website headings, and links to their friend's pages 

* view contains a search tool that searches member's non-friends' website headings
* input for search tool is the keyword, output is the relation between the member's page you are on and the member whose website heading matches the keyword 

ID | A    
----------
1  | Tom  
2  | Max  
3  | Myles 
4  | Faryar 
5  | Alan

 A  | B
--------
 1  | 2 # Tom is friend's with Max 
 1  | 5 
 1  | 6 
 2  | 3 
 3  | 4
 3  | 5 
 4  | 2
 5  | 2
 5  | 6
 5  | 7
 8  | 4
 8  | 10

(path => Alan -> Bart -> Claudia -> Max)
(path => 5 -> 4 -> 8 -> 10)
<!-- Max and Alan have no friends in common -->
* inputs are two ID's (Alan's ID, Max's ID, all IDs)
  - create a graph with all IDs
  - we try to calculate the shortest route from the start point to the end point
* output is a list of lists (the paths) (shortest to longest)

<!-- adjacency list  -->
1: [2, 5, 6]
2: [1, 3]
3: [2, 4]
4: [2, 3, 8]
5: [1, 2, 3, 6, 7]
8: [4, 10]





























