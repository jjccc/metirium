$(document).ready(function(){
  
  $("#send-mail-ok-button").on("click", function(){
    reset_errors();
    $("#new_email").submit();  
  });
  
  $("#send-mail-dialog").on("hide.bs.modal", function(){
    reset_errors();
  });
  
});

function reset_errors(){
  $("#addresses-group").removeClass("has-error");
  $("#subject-group").removeClass("has-error");
  $("#addresses-error").html("").addClass("hidden");
  $("#subject-error").html("").addClass("hidden"); 
}
