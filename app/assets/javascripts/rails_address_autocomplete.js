(function($) {

  $.fn.rails_address_autocomplete = function(options) {

    return this.each(function() {
      setupInput($(this), options);
    });

    function setupInput($container, options) {
      var $input = $container.find('input[type="text"].rails-address-autocomplete-field-street').first();
      if ($input.length == 0) {
        $input = $container.find('input[type="text"].rails-address-autocomplete-field-street').first();
      }

      // $input.on('input', function(){
      //     inputChanged($container);
      // });

      $input.on('change', function() {
        inputChanged($container);
      });

      var autocomplete = new google.maps.places.Autocomplete($input[0], options);

      google.maps.event.addListener(autocomplete, 'place_changed', function() {
        var place = autocomplete.getPlace();
        var data = {};

        if (!place.geometry) {
          dataChanged($container, {});
          return;
        }

        // data['lat'] = place.geometry.location.lat();
        // data['lng'] = place.geometry.location.lng();

        // data['formatted_address'] = place['formatted_address'];

        for (var i = 0; i < place.address_components.length; ++i) {
          if (place.address_components[i].types[0] == 'street_number') {
            data['street_number'] = place.address_components[i].long_name;
          } else if (place.address_components[i].types[0] == 'route') {
            data['street_name'] = place.address_components[i].long_name;
          }
          // else if(place.address_components[i].types[0] == 'country'){
          //     data['country'] = place.address_components[i].long_name;
          //     data['country_code'] = place.address_components[i].short_name;
          // }
          else if (place.address_components[i].types[0] == 'administrative_area_level_1') {
            data['state'] = place.address_components[i].long_name;
            data['state_code'] = place.address_components[i].short_name;
          }
          // else if(place.address_components[i].types[0] == 'administrative_area_level_2'){
          //     data['department'] = place.address_components[i].long_name;
          //     data['department_code'] = place.address_components[i].short_name;
          // }
          else if (place.address_components[i].types[0] == 'locality' ||
            place.address_components[i].types[0] == 'administrative_area3') {
            data['city'] = place.address_components[i].long_name;
          } else if (place.address_components[i].types[0] == 'postal_code') {
            data['zip_code'] = place.address_components[i].long_name;
          }
          // else if(place.address_components[i].types[0] == 'sublocality_level_1'){
          //     data['suburb'] = place.address_components[i].long_name;
          // }
        }

        if (data['street_name']) {
          if (data['street_number']) {
            data['street'] = data['street_name'] + ' ' + data['street_number'];
          } else {
            data['street'] = data['street_name'];
          }
        }

        dataChanged($container, data);
      });
    }

    // Reset values if input value is reset
    function inputChanged($container) {
      var $input = $container.find('input[type="text"]');

      if ($input.val().length == 0) {
        dataChanged($container, {});
      }
    }

    function dataChanged($container, data) {
      updateInputs($container, data);
      $container.trigger('rails_address_autocomplete:address:data_changed', data);
    }

    function updateInputs($container, data) {
      // Reset all fields
      $container.find('[class*="rails-address-autocomplete-field"]').val('');

      for (var attr in data) {
        var value = data[attr];
        $container.find('.rails-address-autocomplete-field-' + attr).val(value);
      }
    }
  };

})(jQuery);
