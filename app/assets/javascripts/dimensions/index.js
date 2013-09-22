$(document).ready(function(){
  set_icons_tooltips();
  set_delete_confirmations();  
});

function set_icons_tooltips(){
  $("a[id|='edit']").each(function(){
    $(this).popover( { trigger: 'hover', content: 'Editar variable', html: false, placement: "bottom" });
  });
  $("a[id|='delete']").each(function(){
    $(this).popover( { trigger: 'hover', content: 'Eliminar variable y todas sus mediciones (si existen)', html: false, placement: "bottom" });
  });
}

function set_delete_confirmations(){
  $("a[id|='delete']").each(function(){
    $(this).on("click", function(){
      var lnk = $(this);
      $("#delete-dimension-dialog-ok-button").on("click", function(){
        $.ajax({
          type: "delete",
          url: lnk.siblings("input[type='hidden']").first().val(),
          dataType: "json"
        }).success(function(data, textStatus, jqXHR){
                     document.location.href = Routes.user_dimensions_path(gon.user_id, {method: 'get'});
                   });
      });
      $("#delete-dimension-dialog").modal("show");      
    });
  });
}
