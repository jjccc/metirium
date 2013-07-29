$(document).ready(function(){
  
  $("#dimension_name").popover( { trigger: 'hover', content: 'Es un nombre descriptivo de lo que quieres medir. Por ejemplo: ¿ha llovido?, litros de lluvia o temperatura diaria.', html: false, placement: "right" });
  $("#dimension_fact_id").popover( { trigger: 'hover', content: 'El tipo de medición determina los datos que se registran. Una medición puntual es aquella que simplemente registra cuando ha sucedido (por ejemplo: ha llovido). Una medición cuantificada registra cuando ha sucedido y en qué cantidad (por ejemplo: han caído 15 litros/m2). Una medición periódica provocará que se realicen muestreos periódicos para medir una acción (por ejemplo, temperatura diaria).', html: false, placement: "right" });
  
});
