[![Build Status](https://travis-ci.org/khalilgharbaoui/inquiries-maker.svg?branch=master)](https://travis-ci.org/khalilgharbaoui/inquiries-maker)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fkhalilgharbaoui%2Finquiries-maker.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fkhalilgharbaoui%2Finquiries-maker?ref=badge_shield)
Inquiries Maker
================

![](https://github.com/khalilgharbaoui/inquiries-maker/raw/master/Inquiries-maker.png)


Issues?
-----------

No issues yet.

Ruby on Rails
-------------

This application requires:

- Ruby 2.5.5
- Rails 5.2.3

Getting Started
---------------
### TODO:
- Improve readme [ ]
- Web server for development? [passenger]
- Web server for production? [passenger]
- Database used in development? [mysql]
- Template engine? [slim]
- Test framework? [rspec]
- Continuous testing? [guard]
- Front-end & Admin framework? [bootstrap4]
- Add support for sending email? [smtp]
- Authentication? [devise]
- Devise modules? [ ]
- OmniAuth provider? [ ]
- Authorization? [ ]
- Set a locale? [de | fr | en]
- Install page-view analytics? [ga]
- Add a deployment mechanism? [capistrano3 | docker]
- Set a robots.txt file to ban spiders? [ ]
- Create a GitHub repository? [true]
- Improve error reporting with 'better_errors' during development? [true]
- Use 'pry' as console replacement during development and test? [true]
- Improve Admin styling... []
- Add notifications to my Telegram [].
- ReactJS snippet with the form in it connecting trough JSON to the main app []


Documentation and Support:
-------------------------

The current forms on this application are not limited to it and can be embedded in
any kind of application or website with or without JavaScript involvement.

The form will be be full screen. But can be responsive to fit in a
limited width container or for mobile view.

Example of a  php short-code function for a WordPress web-application page.

Shortcode:
`[uos_form src"moving"]`

```PHP
# theme/functions.php

// Add Shortcode
function get_uos_form( $atts ) {

        // Attributes
        $atts = shortcode_atts(
                array(
                        'src' => '',
                ),
                $atts,
                'uos_form'
        );
        // form types
        $inquiry_type = array(
              'moving' => '//RAILS_APP_URL/moving_inquiries/new',
              'cleaning' => '//RAILS_APP_URL/cleaning_inquiries/new',
              'combined' => '//RAILS_APP_URL/combined_inquiries/new',
          );

        // Return custom iframe code
        return '<iframe src="'. $inquiry_type[$atts['src']] . '" style="" name="Umzug Offerte Schweiz - Umzug Offerte Form" scrolling="no" width="100%" height="1500"
                style="
                       position: absolute;
                       top:0;
                       left: 0;
                       width: 100%;
                       height: 100%;
                       max-width:100%;
                     " allowfullscreen="">
            </iframe>';

}
add_shortcode( 'uos_form', 'get_uos_form' );
```

Example of a simple HTML iframe.

```HTML
<iframe src="//RAILS_APP_URL/combined_inquiries/new" style="" name="Umzug Offerte Schweiz - Umzug Offerte Form" scrolling="no" width="100%" height="1500"
                style="
                       position: absolute;
                       top:0;
                       left: 0;
                       width: 100%;
                       height: 100%;
                       max-width:100%;
                     " allowfullscreen="">
</iframe>
```
##### This comes on the client side and injects metadata into the iframe

```HTML
<script type="text/javascript" src="https://www.l2.io/ip.js?var=userip"></script>
<script>
var receiver = document.getElementById('iFrameResizer0').contentWindow;

setInterval(function(){
  receiver.postMessage({
    "hostname": window.location.hostname,
    "path": window.location.pathname,
    "referrer": document.referrer,
    "ip": userip // from "https://www.l2.io/ip.js?var=userip"
  }, '*');
}, 1300);

</script>
```

Example of ReactJS snippet:

Coming Soon....

Issues
-------------

Related Projects
----------------
lead-extractor
umzug-offerte-schweiz

Contributing
------------

Credits
-------

License
-------


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fkhalilgharbaoui%2Finquiries-maker.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fkhalilgharbaoui%2Finquiries-maker?ref=badge_large)