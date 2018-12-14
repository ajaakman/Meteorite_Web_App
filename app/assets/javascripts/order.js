$( document ).on('turbolinks:load', function() {
  //$(document).ready(function() {

    $(".buy_button").click(function() {

      orderID = $(this).val()

      $.ajax({
        url: "postings/add_to_cart",
        type: "get",
        data: {
          order_id: orderID
        },
        success: function(response) {
          location.reload();
        }
      })

    })

  //})
})
