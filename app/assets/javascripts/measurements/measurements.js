function do_measurement(user_id){
  if ($( "input:checked" ).length == 0){
    alert("Debes escoger una variable.")
  }
  else {
    dimension_id = parseInt($("input:checked").val());
    type_ctl_name = "dimension_" + dimension_id + "_fact_id";
    fact_id = parseInt($("#" + type_ctl_name).val());
    load_form(user_id, dimension_id, fact_id); 
  }  
}

function load_form(user_id, dimension_id, fact_id){
  $("#step1").hide();
  
  $.ajax({
    url: Routes.user_dimension_path(user_id, dimension_id, {format: 'json'}),
    context: document.body,
    dataType: "json"
  }).success(function(data, textStatus, jqXHR){
    refresh_form(user_id, dimension_id, fact_id, data)    
  }).error(function(jqXHR, textStatus, errorThrown){
    alert("Se ha producido un error");
  });    
}

function refresh_form(user_id, dimension_id, fact_id, data){
  $("#measurement_title").html($(Mustache.to_html($('#dimension_template').html(), data)));
  $("#new_measurement").attr("action", Routes.user_dimension_measurements_path(user_id, dimension_id))
  switch(fact_id){
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
    load_form(gon.user_id, gon.dimension_id, gon.fact_id);
  }
  else {
    $("#step1").show();
    $("#step2").hide();
  }
    
  $("#measurement_comment").popover( { trigger: 'hover', content: 'Es una descripción que te permitirá marcar ciertas mediciones que consideres especiales de esta variable. Por ejemplo: Si estás midiendo la temperatura diaria, te podría interesar resaltar cuando es tu cumpleaños añadiendo un comentario.', html: false, placement: "bottom" });
  $("#measurement_amount").popover( { trigger: 'hover', content: 'Es el número de unidades que va a registrar la medición. Por ejemplo: Si estás midiendo la temperatura diaria, aquí escribirás el número de grados (sin unidad).', html: false, placement: "bottom" });
});
