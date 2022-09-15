$(document).ready(function() {
  $('#search-form').change(function () {
    $.ajax({
      type: "GET",
      contentType: "application/json",      
      url: "/medicines",
      data: {q: this.value},
      success: function(data){
        alert(data);
      }
    });
  });
});