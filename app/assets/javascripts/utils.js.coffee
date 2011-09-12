$.urlParam = (name)->
  results = new RegExp("[\\?&]#{name}=([^&#]*)").exec(window.location.href)
  if results then results[1] else ""
