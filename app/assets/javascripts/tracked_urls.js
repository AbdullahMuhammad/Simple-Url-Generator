// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
    $('.btn-visit').click(function(e){
        e.preventDefault();
        window.open($(this).data('destination'), '_blank');
        $.get( $(this).attr('href'), function( data ) {
        });
        return;
    });
});
