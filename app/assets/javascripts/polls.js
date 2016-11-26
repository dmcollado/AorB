// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// main = function() {
//   previewItemA();
//   // previewItemB();
// }

// previewItemA = function() {
//   var itemA = $("#item_a");
//   itemA.click(function(e) {
//     e.preventDefault();
//     console.log("Item A clicked");
//   });
// }

// // previewItemB = function() {
// //   var itemb = $("#item_b");
// // }


// $(document).on("turbolinks:load", main());

$(function() {
  $(document).on("keyup, change", "input#item_a_url", function() {
  	$("#item_a_image > img").attr("src", $(this).val());
  })
  $(document).on("keyup, change", "input#item_b_url", function() {
    $("#item_b_image > img").attr("src", $(this).val());
  })
})

$(document).on('turbolinks:load', function() {
  console.log("loaded.");

})

var openFileA = function(event) {
    var input = event.target;

    var reader = new FileReader();
    reader.onload = function(){
      var dataURL = reader.result;
      var output = document.querySelector('#item_a_image > img');
      output.src = dataURL;
    };
    reader.readAsDataURL(input.files[0]);
  };

var openFileB = function(event) {
    var input = event.target;

    var reader = new FileReader();
    reader.onload = function(){
      var dataURL = reader.result;
      var output = document.querySelector('#item_b_image > img');
      output.src = dataURL;
    };
    reader.readAsDataURL(input.files[0]);
  };



