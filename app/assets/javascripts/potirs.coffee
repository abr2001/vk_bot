# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#link-new-potir').click (e) ->
    e.preventDefault();
    $(this).hide();
    $('#form-potir').show();

  $('#cancel-form-potir').click (e) ->
    e.preventDefault();
    $('#link-new-potir').show();
    $('#form-potir').hide();
