$ ->
  if $("#dish_magic").get(0)
    setTimeout ->
      $("#dish_magic").autocomplete {
      source: $("#dish_magic").data("autocomplete-dishes-path")}
    , 1

  $("#restaurant_magic").autocomplete
    source: $("#restaurant_magic").data("autocomplete-restaurants-path")
    minLength: 2
    select: (event, ui) ->
      item = ui.item
      if item
        $("#link_magic").val item.link

