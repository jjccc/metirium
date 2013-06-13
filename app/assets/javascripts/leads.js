$(document).ajaxSuccess(function(event, data, status, xhr){
    $("#myModal").modal("show");
});

$(document).ajaxError(function(event, data, status, xhr){
    alert(data.responseJSON.email[0]);
});