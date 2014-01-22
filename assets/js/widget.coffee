getElementsByClassName = (node, classname) ->
  if node.getElementsByClassName # use native implementation if available
    node.getElementsByClassName classname
  else
    (getElementsByClass = (searchClass, node) ->
      node = document  unless node?
      classElements = []
      els = node.getElementsByTagName("*")
      elsLen = els.length
      pattern = new RegExp("(^|\\s)" + searchClass + "(\\s|$)")
      i = undefined
      j = undefined
      i = 0
      j = 0

      while i < elsLen
        if pattern.test(els[i].className)
          classElements[j] = els[i]
          j++
        i++
      classElements
    ) classname, node

fetchWidget = (url, element) ->
  xhr = new XMLHttpRequest()
  xhr.onreadystatechange = ->
    element.innerHTML = xhr.responseText  if xhr.readyState is 4 and xhr.status is 200

  xhr.open "GET", url, true
  xhr.send()

construct_query_string = (e) ->
  query = ""
  
  query = '/news' + "?"

  for i in ["location", "max_results", "height", "width", "locale"]
  	query += i + "=" + e.getAttribute(i) + "&"  if e.getAttribute(i)

  query

(->
  tag = document.createElement("link")
  tag.href = "/css/widget_style.css"
  tag.rel = "stylesheet"
  tag.type = "text/css"

  document.getElementsByTagName("head")[0].appendChild tag
  elements = getElementsByClassName(document, "widget")

  for i in elements
  	fetchWidget construct_query_string(i), i

)()