$ ->
#  if $("#restaurant_magic").get(0)
#    setTimeout ->
#      $("#restaurant_magic").autocomplete {
#      source: $("#restaurant_magic").data("autocomplete-restaurants-path")}
#    , 1

  $("#restaurant_magic").autocomplete
    source: $("#restaurant_magic").data("autocomplete-restaurants-path")
    minLength: 2
    select: (event, ui) ->
      item = ui.item
      if item
        $("#email_magic").val item.link

