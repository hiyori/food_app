$ ->
  if $("#restaurant_magic").get(0)
    setTimeout ->
      $("#restaurant_magic").autocomplete {source: $("#restaurant_magic").data("autocomplete-restaurants-path")}
    , 1


