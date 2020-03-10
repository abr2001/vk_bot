# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.do-commenter').click (e) ->
    account_id = $(this).data('accountId')
    $.ajax
      url:      '/checked_commenter'
      type:     'POST'
      dataType: 'json'
      data:     { id: account_id, checked: this.checked }
    .fail (response) ->
      el = $('#commenter' + account_id)[0]
      el.checked = !el.checked


$ ->
  $('.link_edit_proxy_account').click (e) ->
    e.preventDefault();
    account_id = $(this).data('accountId')
    $form = $('#form-proxy-account-'+ account_id)
    if $form.css('display') == 'none'
      $form.show()
    else
      $form.hide()


$ ->
  $('.btn-cancel-proxy-form').click (e) ->
    e.preventDefault();
    account_id = $(this).data('accountId')
    $form = $('#form-proxy-account-'+ account_id)
    $form.hide()


