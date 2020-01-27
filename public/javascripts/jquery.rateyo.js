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
