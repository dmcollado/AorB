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
  
  // $(document).on("keyup, change", "input#poll_item_avatar", function() {
  // 	console.log("Grabbing Paperclip URL", $(this).val());
  //   $("#item_a_image > img").attr("src", $(this).val());
  // })
  

})

