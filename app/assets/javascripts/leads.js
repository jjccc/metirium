$(document).ajaxSuccess(function(event, data, status, xhr){
  destroy_popovers();
  $("#lead_name").val("");
  $("#lead_email").val("");
  $("#congrats-title").replaceWith($( Mustache.to_html($('#congrats_title_template').html(), data.responseJSON) ));    
  $("#congrats-dialog").modal("show");    
});

$(document).ajaxError(function(event, data, status, xhr){
  destroy_popovers();
  if (data.responseJSON.email.length > 0){
    var msg = {message: data.responseJSON.email[0]};
    $("#lead_email").popover( { title: "Algo está mal", content: $( Mustache.to_html($('#popover_error_template').html(), msg) ), html: true, placement: "bottom" });
    $("#lead_email").popover("show");
  }
  if (data.responseJSON.name.length > 0){
    var msg = {message: data.responseJSON.name[0]};
    $("#lead_name").popover( { title: "Algo está mal", content: $( Mustache.to_html($('#popover_error_template').html(), msg) ), html: true, placement: "bottom" });
    $("#lead_name").popover("show");
  }
});

function destroy_popovers(){
  $("#lead_email").popover("destroy");
  $("#lead_name").popover("destroy");
}
