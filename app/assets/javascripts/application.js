// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui-1.10.3.custom.min
//= require bootstrap.min
//= require mustache
//= require js-routes
//= require highcharts
//= require d3.v3.min
//= require cal-heatmap.min

$(document).ready(function(){

  // Diálogo modal de contacto
  $("#contact").click(function(){
    $("#contact-dlg").modal(); 
  });
  
});
