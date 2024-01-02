// app/assets/javascripts/application.js
//= require rails-ujs
//= require turbolinks
//= require_tree .
// app/assets/javascripts/application.js
$(document).on('turbolinks:load', function() {
  $('.nested-fields').on('click', '.remove-fields', function(event) {
    $(this).closest('.nested-fields').remove();
    event.preventDefault();
  });

  $('.add-fields').on('click', function(event) {
    var time = new Date().getTime();
    var regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });
});
