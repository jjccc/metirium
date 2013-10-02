$(document).ready(function(){
  
  // Diálogo modal de contacto
  $("#contact").click(function(){
    $("#contact-dialog").modal({remote: gon.contact_url});
    $("#contact-dialog").modal("show");          
  });
  
});