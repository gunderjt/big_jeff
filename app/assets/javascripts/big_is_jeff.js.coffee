ready = ->
  $("#calculate").on("ajax:success", (e, data, status) ->
    # console.log(data)
    $("#results").html data
  ).on "ajax:error", (e,xhr, status, error) ->
    $("#results").append "<p>ERROR</p>"

$(document).ready(ready)
$(document).on('page:load', ready)