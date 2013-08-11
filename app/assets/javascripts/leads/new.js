$(document).ajaxSuccess(function(event, data, status, xhr){
  destroy_popovers();
  $("#lead_email").val("");
  $("#congrats-dlg").modal();    
});

$(document).ajaxError(function(event, data, status, xhr){
  destroy_popovers();
  if (data.responseJSON.hasOwnProperty("email") && data.responseJSON.email.length > 0){
    var msg = {message: data.responseJSON.email[0]};
    $("#lead_email").popover( { title: "Algo está mal", content: $( Mustache.to_html($('#popover_error_template').html(), msg) ), html: true, placement: "bottom" });
    $("#lead_email").popover("show");
  }
});

function destroy_popovers(){
  $("#lead_email").popover("destroy");
}
