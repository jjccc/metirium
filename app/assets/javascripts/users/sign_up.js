$(document).ready(function(){
  
  $("#user_email").popover( { trigger: 'hover', content: 'Es tu dirección de correo electrónico. Lo usaremos para comunicarnos contigo.', html: false, placement: "right" });
  $("#user_password").popover( { trigger: 'hover', content: 'La contraseña debe tener como mínimo 6 caracteres y contener al menos un número. Lo hacemos así, para que sea más difícil que alguien la descubra.', html: false, placement: "right" });
  $("#user_password_confirmation").popover( { trigger: 'hover', content: 'Repite la contraseña para garantizar que la has escrito correctamente.', html: false, placement: "right" });
  
});


