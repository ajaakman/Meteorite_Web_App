$( document ).on('turbolinks:load', function() {
  //$(document).ready(function() {

    $(".order_button").click(function() {
      $.ajax({
        url: "order",
        type: "get",
        data: {
        },
        success: function(response) {
          location.reload();
        }
      })

    })

  //})
})
