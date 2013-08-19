function do_measurement(user_id){
  if (parseInt($("#selected_dimension_id").val())){
    load_form(user_id, parseInt($("#selected_dimension_id").val()));    
  }
  else {
    alert("Debes escoger una variable."); 
  }  
}

function load_form(user_id, dimension_id){
  $("#step1").hide();
  
  $.ajax({
    url: Routes.user_dimension_path(user_id, dimension_id, {format: 'json'}),
    context: document.body,
    dataType: "json"
  }).success(function(data, textStatus, jqXHR){
    refresh_form(user_id, data);    
  }).error(function(jqXHR, textStatus, errorThrown){
    alert("Se ha producido un error");
  });    
}

function refresh_form(user_id, data){
  $("#measurement_title").html($(Mustache.to_html($('#dimension_template').html(), data)));
  $("#new_measurement").attr("action", Routes.user_dimension_measurements_path(user_id, data.id));
  switch(data.fact_id){
    case 1:
      $("#spot_help_text").show();
      $("#quantified_help_text").hide();
      $("#periodic_help_text").hide(); 
      $("#amount_block").hide();    
      break;
    case 2:
      $("#spot_help_text").hide();
      $("#quantified_help_text").show();
      $("#periodic_help_text").hide();
      $("#amount_block").show();
      break;
    case 3:
      $("#spot_help_text").hide();
      $("#quantified_help_text").hide();
      $("#periodic_help_text").show();
      $("#amount_block").hide();
      break;
  }
  $("#step2").show();
}

$(document).ready(function(){
  if (gon.is_step2){
    load_form(gon.user_id, gon.dimension_id);
  }
  else {
    $("#step1").show();
    $("#step2").hide();
  }
  
  $("#dimension_tokens").autocomplete({
    source: Routes.user_dimensions_path(gon.user_id, {format: 'json'}),
    minLength: 2,
    select: function( event, ui ) {
      $("#selected_dimension_id").val(ui.item.id);
      $("input:checked").removeAttr("checked");
    }
  });
 
  $("input[type|='radio']").click(function(){
    $("#dimension_tokens").val("");
    $("#selected_dimension_id").val($(this).val());    
  });
  
  $("input:checked").removeAttr("checked");
 
  $("#measurement_comment").popover( { trigger: 'hover', content: 'Es una descripción que te permitirá marcar ciertas mediciones que consideres especiales de esta variable. Por ejemplo: Si estás midiendo la temperatura diaria, te podría interesar resaltar cuando es tu cumpleaños añadiendo un comentario.', html: false, placement: "bottom" });
  $("#measurement_amount").popover( { trigger: 'hover', content: 'Es el número de unidades que va a registrar la medición. Por ejemplo: Si estás midiendo la temperatura diaria, aquí escribirás el número de grados (sin unidad).', html: false, placement: "bottom" });
});
