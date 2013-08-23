$(document).ready(function(){
  
  $("#dimension_fact_id_1").prop("checked", true);  
  $("#dimension_name").popover( { trigger: 'hover', content: 'Es un nombre descriptivo de lo que quieres medir. Por ejemplo: ¿ha llovido?, litros de lluvia o temperatura diaria.', html: false, placement: "bottom" });
  $("#dimension_fact_id").popover( { trigger: 'hover', content: 'El tipo de variable determina los datos que se registran. Una variable puntual es aquella que simplemente registra cuando ha sucedido (por ejemplo: ha llovido). Una variable cuantificada registra cuando ha sucedido y en qué cantidad (por ejemplo: han caído 15 litros/m2). Una variable periódica provocará que se realicen muestreos periódicos para medir una acción (por ejemplo, temperatura diaria).', html: false, placement: "right" });
  
});
