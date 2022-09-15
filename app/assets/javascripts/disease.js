$(document).ready(function() {
    $('#search-form').change(function () {
      $.ajax({
        type: "GET",
        contentType: "application/json",      
        url: "/diseases",
        data: {q: this.value},
        success: function(data){
          alert(data);
        }
      });
    });
  });

  