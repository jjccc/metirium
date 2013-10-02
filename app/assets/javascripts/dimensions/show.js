$(document).ready(function(){
  $("#twitter_share").click(function(){
    return social_dialog('https://twitter.com/intent/tweet?original_referer=' + encodeURIComponent(gon.url) + '&text=' + encodeURIComponent(gon.tweet) + '&tw_p=tweetbutton&url=' + encodeURIComponent(gon.url) + '&via=metirium', 'twitter-share-dialog');
  });
  $("#facebook_share").click(function(){
    return social_dialog('https://www.facebook.com/sharer/sharer.php?u='+ encodeURIComponent(gon.url), 'facebook-share-dialog');
  });
  $("#email_share").click(function(){
    $("#send-mail-dialog").modal({remote: Routes.new_user_email_path(gon.user_id, {d: gon.dimension_id})});
    $("#send-mail-dialog").modal("show");    
  });
  $("#privacity_button").popover( { trigger: 'hover', content: 'Si una variable es pública, será visible para todo el mundo. Si es privada, sólo será visible por el usuario que la ha creado. Si deseas publicar en Twitter, Facebook o enviar por correo la variable debe ser pública.', html: false, placement: "bottom" });
  $("#twitter_logo").popover( { trigger: 'hover', content: 'Publicar en Twitter', html: false, placement: "bottom" });
  $("#facebook_logo").popover( { trigger: 'hover', content: 'Publicar en Facebook', html: false, placement: "bottom" });
  $("#email_logo").popover( { trigger: 'hover', content: 'Enviar por correo electrónico', html: false, placement: "bottom" });
  $("#delete-dimension-button").on("click", function(){      
    $("#delete-dimension-dialog-ok-button").on("click", function(){
      $.ajax({
        type: "delete",
        url: Routes.user_dimension_path(gon.user_id, gon.dimension_id),
        dataType: "json"
      }).success(function(data, textStatus, jqXHR){
                   document.location.href = Routes.user_dashboards_path(gon.user_id);
                 });
    });
    $("#delete-dimension-dialog").modal("show");      
  });
});

function social_dialog(url, id){
  var w = 626;
  var h = 436;
  var left = (screen.width/2)-(w/2);
  var top = (screen.height/2)-(h/2);
  window.open(url, id, 'width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
  return false;
}
