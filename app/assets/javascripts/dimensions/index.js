$(document).ready(function(){
  set_icons_tooltips();  
});

function set_icons_tooltips(){
  $("a[id|='edit']").each(function(){
    $(this).popover( { trigger: 'hover', content: 'Editar variable', html: false, placement: "bottom" });
  });
  $("a[id|='delete']").each(function(){
    $(this).popover( { trigger: 'hover', content: 'Eliminar variable y todas sus mediciones (si existen)', html: false, placement: "bottom" });
  });
}
