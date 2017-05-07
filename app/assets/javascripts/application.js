// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require cocoon
//= require intltelinput_rails
//= require_tree .

function formatNumber() {
  $('.phone-input').on('keyup countrychange', function() {
    $(this).val($(this).intlTelInput('getNumber'));
  })
}

function initTelMask() {
  $('.phone-input').intlTelInput({
    nationalMode: true,
    preferredCountries: ['us', 'gb']
  });
  formatNumber();
}

$(document).on('turbolinks:load', function() {
  var converter = new showdown.Converter();
  $('#project_body').keyup(function(event) {
    var mdown = $(this).val();
    var html = converter.makeHtml(mdown);
    $('#body-preview').html(html);
  })
  initTelMask();

  // bootstrapify file inputs
  $(':file').filestyle();

  $('#contacts').on('cocoon:after-insert', function() {
    $('.phone-input').intlTelInput({
      nationalMode: true
    });
    formatNumber();
  })
})
