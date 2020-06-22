// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
//= require jquery-ui
//= require highcharts
//= require chartkick
//= require Chart.bundle

  window.googleMapInitialize = function(){
      // Advanced usage with google options
      $('.rails-address-autocomplete').rails_address_autocomplete({
          // type: ['restaurant'],
          componentRestrictions: { country: 'ch' }

      });
      console.log( "CALLED! 👊 ready!" );

  };
// This function is call when Google Maps is loaded


// $('.rails-address-autocomplete').on('change:address:data_changed', function(event, data){
// 	console.log("LOG: " + data);
// });
