$(document).ajaxSuccess(function(event, request, settings){
  if (settings.url.indexOf("dimensions") > 0){
    $("#dimensions").html("");
    for(var i = 0; i < request.responseJSON.length; i++){
      $("#dimensions").append($(Mustache.to_html($('#dimension_template').html(), request.responseJSON[i])));
    };  
  }
  
  if (settings.url.indexOf("measurements") > 0){
    $("#measurements").html("");
    for(var i = 0; i < request.responseJSON.length; i++){
      $("#measurements").append($(Mustache.to_html($('#measurement_template').html(), request.responseJSON[i])));
    };  
  }
  
});

