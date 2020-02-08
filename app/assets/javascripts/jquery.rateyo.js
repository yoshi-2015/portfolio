// post
$(function () {

  $("#rateYo").rateYo({

    onSet: function (rating, rateYoInstance) {

      alert(" スコアを " + rating　+ " 点にしました！ ");
      document.getElementById( "score" ).value = rating ;
    }
  });
});

var onSet = $("#rateYo").rateYo("option", "onSet");

$("#rateYo").rateYo("option", "onSet", function () {
    console.log("This is a new function");
});

// top

  // $(function () {
  //   comment_array = $('#comment_array').val().split('');
  //   $.each(comment_array, function(index, value) {
  //     $(function () {
  //       $('#rateYo-' + value).rateYo({
  //         starWidth: "20px",
  //         rating: Number($("#rateYo-" + value).data('star')),
  //         halfStar: true,
  //         readOnly: true
  //       });
  //     });
  //   })
  // })
