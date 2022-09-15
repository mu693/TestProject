$(document).ready(function() {
    $('#search-form').change(function () {
      $.ajax({
        type: "GET",
        contentType: "application/json",      
        url: "/categories",
        data: {q: this.value},
        success: function(data){
          alert(data);
        }
      });
    });
  });