$(document).ready(function(){
  
  $("#contact-ok-button").on("click", function(){  
    contact_reset_errors();      
    $("#contact_email").submit();    
  });
  
  $("#contact-dialog").on("hide.bs.modal", function(){
    contact_reset_errors();
  });
  
});

function contact_reset_errors(){
  $("#contact-addresses-group").removeClass("has-error");
  $("#contact-subject-group").removeClass("has-error");
  $("#contact-addresses-error").html("").addClass("hidden");
  $("#contact-subject-error").html("").addClass("hidden");
}
