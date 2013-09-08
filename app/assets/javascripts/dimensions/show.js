$(document).ready(function(){
  $("#privacity_button").popover( { trigger: 'hover', content: 'Si una variable es pública, será visible para todo el mundo. Si es privada, sólo será visible por el usuario que la ha creado. Si deseas publicar en Twitter, Facebook o enviar por correo la variable debe ser pública.', html: false, placement: "bottom" });
});

!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
