jsLibrary
=========

This is an example how to create a small widget based on a self contained JS library. 

The basic idea is that the user should be able to add a few lines of HTML in order to include a configure a HTML/CSS/JS widget. In this example, the following lines of code are used to insert the widget into a page. 

```
<div class="widget" type="example" location="rome" locale="it"/>
<script src="/js/widget.js" type="text/javascript"></script>
```

You can try a live demo here http://jslibrary.herokuapp.com/

## Installation

Clone the repository and then execute: 

```
bundle install
ruby server.rb
````

You can see the demo by accessing the page http://localhost:4567

