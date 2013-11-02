//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require modernizr
//= require jquery.windy
//= require jquery.url

$(document).ready(function() {
  var $el = $( '#wi-el' ),
  windy = $el.windy({
    boundaries : {
      rotateX : { min : 40 , max : 90 },
      rotateY : { min : -15 , max : 15 },
      rotateZ : { min : -5 , max : 5 },
      translateX : { min : -200 , max : 200 },
      translateY : { min : -300 , max : -200 },
      translateZ : { min : 50 , max : 100 }
    }
  }),
  allownavnext = false,
  allownavprev = false;

  $( '#nav-prev' ).on( 'mousedown', function( event ) {

    allownavprev = true;
    navprev();

  } ).on( 'mouseup mouseleave', function( event ) {

    allownavprev = false;

  } );

  $( '#nav-next' ).on( 'mousedown', function( event ) {

    allownavnext = true;
    navnext();

  } ).on( 'mouseup mouseleave', function( event ) {

    allownavnext = false;

  } );

  function navnext() {
    if( allownavnext ) {
      windy.next();
      setTimeout( function() {
        navnext();
      }, 150 );
    }
  }

  function navprev() {
    if( allownavprev ) {
      windy.prev();
      setTimeout( function() {
        navprev();
      }, 150 );
    }
  }

  $(document).keydown(function(e) {
    if (e.keyCode === 37) {
      allownavprev = true;
      navprev();
      allownavprev = false;
    } else if (e.keyCode === 39) {
      allownavnext = true;
      navnext();
      allownavnext = false;
    }
  });

  $('#search-input').val(decodeURIComponent($.url.param('q')));
  $('#search-input').focus(function(){
    $(this).on('keypress', function(e){
      if(e.keyCode == 13){
        $('#search-bar').trigger('click');
      }
    });
  });

  $('#search-bar').click(function(){
    window.location = '/search?q=' + encodeURIComponent($('#search-input').val());
  });
});