$(document).on("turbolinks:load", function () {
  $("#main").mouseover(function () {
    $("#mini-fab").removeClass("d-none");
  });

  $("#main").focusout(function () {
    $("#mini-fab").addClass("d-none");
  });

  $('[data-toggle="tooltip"]').tooltip();
  // Initialize popover component
  $('[data-toggle="popover"]').popover();
});