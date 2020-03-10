# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.link-form-login-vk').click (e) ->
    e.preventDefault();
    $(this).hide();
    $('input#email').val('')
    $('input#password').val('')
    $('input#code').val('')
    $('.form-login-vk').show();

  $('#cancel_auth_vk').click (e) ->
    e.preventDefault();
    $('.link-form-login-vk').show();
    $('.form-login-vk').hide();
