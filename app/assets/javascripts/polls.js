// Don't know who wrote this, or what it does. -R
// $(function() {
//   $(document).on("keyup, change", "input#item-a-url", function() {
//     $("#item-a-image").attr("src", $(this).val());
//   })
//   $(document).on("keyup, change", "input#item-b-url", function() {
//     $("#item-b-image > img").attr("src", $(this).val());
//   })
// })


$(document).on('turbolinks:load', function() {
  
  console.log("loaded.");

  $('.submit-btn').prop('disabled', true);

  //share button stop click
  $('#share-button > .share').click(function(e){
    e.preventDefault();
  });

  $('#item-a-image').on('load', function(){
    tallWideImage('a');
  });

  $('#item-b-image').on('load', function(){
    tallWideImage('b');
  });


  function resetFormElement(formInput) {
    $(formInput).wrap('<form>').closest('form').get(0).reset();
    $(formInput).unwrap();
  }

  function showVoteCount() {
    $('.vote-link').contents().delay(500).unwrap();
    $('.poll-item-image').addClass('drop-opacity');
    $('.vote-count').addClass('show-vote-count');
  }

  //null vote

    $('.btn-vote').click(function(){
      if ($('.vote-link').length) {
        showVoteCount();
        subscribeNullVote();
      }
    });


  //Put in a vote
  $('.vote-link').click(function(e){
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      type: "post",
      dataType: "JSON"
    })
    .done(function(data){

      console.log(data);

      $('#vote-count-a').html(data.vote_count_a);
      $('#vote-count-b').html(data.vote_count_b);
      showVoteCount();
      publishNub();

    });
  });


  //show and hide the menu
  $('.btn-menu').click(function() {
    $('.menu-container').toggleClass('show-menu');
  });


  //hide and show elements when the reset buttons are clicked. Needs to be refactored.
  $('#reset-button-a').click(function(event) {
    //Clear the file out

    //First method to reset file input, 
    //replace the type with blank and restore it to file. 
    //Doesn't work in Safari.

    // $('#poll-file-a').attr('type', '');
    // $('#poll-capture-a').attr('type', '');
    // $('#poll-file-a').attr('type', 'file');
    // $('#poll-capture-a').attr('type', 'file');


    //Remove the photo from view
    $('#item-a-image').attr('src', '');

    // restore the take photo icon
    $('#poll-item-a > .poll-inner').toggle('visibility');

    //Second method to reset file input. Wraps a form around the input
    //Resets that new form. Then unwraps it.
    //Supposedly won't work in IE11
    resetFormElement('#poll-file-a');
    resetFormElement('#poll-capture-a');

    //remove the ready from button. Doesn't check if it's actually set.
    $('.submit-btn').removeClass('ready');
    $('.submit-btn').prop('disabled', true);

    //remove the size classes for the image
    $('#item-a-image').removeClass('tall-image wide-image');

    //hide the reset button
    $(this).toggleClass('hide');

    //restore this/that text
    $('#middle-text-a').delay(500).toggleClass('hide');

    //don't allow a regular link click
    event.preventDefault();
  });

  $('#reset-button-b').click(function(event) {
    $('#item-b-image').attr('src', '');
    $('#poll-item-b > .poll-inner').toggle('visibility');
    resetFormElement('#poll-file-b');
    resetFormElement('#poll-capture-b');
    $('.submit-btn').removeClass('ready');
    $('.submit-btn').prop('disabled', true);
    $('#item-b-image').removeClass('tall-image wide-image');
    $(this).toggleClass('hide');
    $('#middle-text-b').delay(500).toggleClass('hide');
    event.preventDefault();
  });

  //Remove .hide on load for animation in the middle
  $('.poll-middle-text').toggleClass('hide');

  //magnify and minify the images
  $('.expand-button').click(function(){
    $(this).toggleClass('expand-button-show');
  });

});

function tallWideImage(pollLetter) {
    var itemImage = "#item-" + pollLetter + "-image";
      if ($(itemImage).height() < $(itemImage).width()){
      console.log('wide');
      $(itemImage).addClass('wide-image');
      } else {
      console.log('tall');
      $(itemImage).addClass('tall-image');
      };
}



//Show the image that has been selected by the user
var openFile = function(event, pollLetter) {
  var itemImage = "#item-" + pollLetter + "-image";
  var input = event.target;
  var reader = new FileReader();

  reader.onload = function(){
    var dataURL = reader.result;
    var output = document.querySelector(itemImage);
    output.src = dataURL;

    //set the reset button letter
    var resetButton = "#reset-button-" + pollLetter;

    //hide the image upload elements
    $('#poll-item-' + pollLetter + ' > .poll-inner').toggle('visibility');

    //show the reset button
    $(resetButton).toggleClass('hide');

    //hide the this or that text
    $('#middle-text-' + pollLetter).delay(500).toggleClass('hide');

    //if the image is horizontal, change the css so it fills the circle
    tallWideImage(pollLetter);

    //if both images are set, change the submit button
    if ($('#item-a-image').attr('src') && $('#item-b-image').attr('src')) {
      $('.submit-btn').removeAttr('disabled');
      $('.submit-btn').addClass('ready');
    }

  };
  reader.readAsDataURL(input.files[0]);
};