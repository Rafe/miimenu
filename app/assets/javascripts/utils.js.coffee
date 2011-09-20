$.urlParam = (name)->
  results = new RegExp("[\\?&]#{name}=([^&#]*)").exec(window.location.href)
  if results then results[1] else ""

$.digest = (text,length,end)->
  if text.length > length
    #find previous word end
    lastWord = length - 1
    lastWord-- while text[lastWord] isnt " "
    text.slice(0,lastWord) + end
  else
    text

$.pluralize = (count,unit)->
  return "#{count} #{unit}s" if count > 1
  "#{count} #{unit}"
