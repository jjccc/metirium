$(document).ready(function(){
  
  $("#user_email").popover( { trigger: 'hover', content: 'Es tu dirección de correo electrónico. Lo usaremos para comunicarnos contigo.', html: false, placement: "bottom" });
  $("#user_password").popover( { trigger: 'hover', content: 'La contraseña debe tener como mínimo 8 caracteres y contener al menos un número. Lo hacemos así, para que sea más difícil que alguien la descubra.', html: false, placement: "bottom" });
  $("#user_password_confirmation").popover( { trigger: 'hover', content: 'Repite la contraseña para garantizar que la has escrito correctamente.', html: false, placement: "bottom" });
  $("#user_remember_me").popover( { trigger: 'hover', content: 'Si marcas esta opción la próxima vez que entres en la página no tendrás que escribir tu correo y tu contraseña.', html: false, placement: "bottom" });
  
});


