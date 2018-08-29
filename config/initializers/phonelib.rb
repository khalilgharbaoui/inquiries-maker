# frozen_string_literal: true

# https://github.com/daddyz/phonelib
# To set the default country (country names are ISO 3166-1 Alpha-2 codes)
Phonelib.default_country = 'CH'

# To use the ability to parse special numbers (Short Codes, Emergency etc.) you can set Phonelib.parse_special. This is disabled by default
Phonelib.parse_special = true

# To allow vanity phone numbers conversion you can set Phonelib.vanity_conversion to true. This will convert characters in passed phone number to their numeric representation (800-CALL-NOW will be 800-225-5669).
# Phonelib.vanity_conversion = true

# To disable sanitizing of passed phone number (keeping digits only)
# Phonelib.strict_check = true

# To set different extension separator on formatting, this setting doesn't affect parsing. Default setting is ';'
# Phonelib.extension_separator = ';'

# To set symbols that are used for separating extension from phone number for parsing use Phonelib.extension_separate_symbols method. Default value is '#;'. In case string is passed each one of the symbols in the string will be treated as possible separator, in case array was passed each string in array will be treated as possible separator.

# Phonelib.extension_separate_symbols = '#;'           # for single symbol separator
# Phonelib.extension_separator = %w(ext # ; extension) # each string will be treated as separator

# In case you need to overwrite some Google's libphonenumber library data, you need to assign file path to this setter. File should be Marshal.dump'ed with existing structure like in Phonelib.phone_data. Gem is simply doing merge between hashes.

# Phonelib.override_phone_data = '/path/to/override_phone_data.dat'

# In case phone number that was passed for parsing has "+" sign in the beginning, library will try to detect a country regarding the provided one.

# ActiveRecord Integration
# This gem adds validator for active record. Basic usage:
#
# validates :attribute, phone: true

# This will enable Phonelib validator for field "attribute". This validator checks that passed value is valid phone number. Please note that passing blank value also fails.
#
# Additional options:
#
# validates :attribute, phone: { possible: true, allow_blank: true, types: [:voip, :mobile], country_specifier: -> phone { phone.country.try(:upcase) } }
# possible: true - enables validation to check whether the passed number is a possible phone number (not strict check). Refer to Google libphonenumber for more information on it.
#
# allow_blank: true - when no value passed then validation passes
#
# types: :mobile or types: [:voip, :mobile] - allows to validate against specific phone types patterns, if mixed with possible will check if number is possible for specified type
#
# country_specifier: -> phone { phone.country.try(:upcase) } - allows to specify country for validation dynamically for each validation.
#
# extensions: false - set to perform check for phone extension to be blank
#
# Basic usage
# To check if phone number is valid simply run:
#
# Phonelib.valid?('123456789') # returns true or false
# Additional methods:
#
# Phonelib.valid? '123456789'      # checks if passed value is valid number
# Phonelib.invalid? '123456789'    # checks if passed value is invalid number
# Phonelib.possible? '123456789'   # checks if passed value is possible number
# Phonelib.impossible? '123456789' # checks if passed value is impossible number
# There is also option to check if provided phone is valid for specified country. Country should be specified as two letters country code (like "US" for United States). Country can be specified as String 'US' or 'us' as well as symbol :us.
#
# Phonelib.valid_for_country? '123456789', 'XX'   # checks if passed value is valid number for specified country
# Phonelib.invalid_for_country? '123456789', 'XX' # checks if passed value is invalid number for specified country
# Additionally you can run:
#
# phone = Phonelib.parse('123456789')
# You can pass phone number with extension, it should be separated with ; or # signs from the phone number.
#
# Returned value is object of Phonelib::Phone class which have following methods:
#
# # basic validation methods
# phone.valid?
# phone.invalid?
# phone.possible?
# phone.impossible?
#
# # validations for countries
# phone.valid_for_country? 'XX'
# phone.invalid_for_country? 'XX'
# You can also fetch matched valid phone types
#
# phone.types          # returns array of all valid types
# phone.type           # returns first element from array of all valid types
# phone.possible_types # returns array of all possible types
# Possible types:
#
# :premium_rate - Premium Rate
# :toll_free - Toll Free
# :shared_cost - Shared Cost
# :voip - VoIP
# :personal_number - Personal Number
# :pager - Pager
# :uan - UAN
# :voicemail - VoiceMail
# :fixed_line - Fixed Line
# :mobile - Mobile
# :fixed_or_mobile - Fixed Line or Mobile (if both mobile and fixed pattern matches)
# :short_code
# :emergency
# :carrier_specific
# :sms_services
# :expanded_emergency
# :no_international_dialling
# :carrier_services
# :directory_services
# :standard_rate
# :carrier_selection_codes
# :area_code_optional
# Or you can get human representation of matched types
#
# phone.human_types # return array of human representations of valid types
# phone.human_type  # return human representation of first valid type
# Also you can fetch all matched countries
#
# phone.countries       # returns array of all matched countries
# phone.country         # returns first element from array of all matched countries
# phone.valid_countries # returns array of countries where phone was matched against valid pattern
# phone.valid_country   # returns first valid country from array of valid countries
# phone.country_code    # returns country phone prefix
# Also it is possible to get formatted phone number
#
# phone.international      # returns formatted e164 international phone number
# phone.national           # returns formatted national number with national prefix
# phone.area_code          # returns area code of parsed number or nil
# phone.local_number       # returns local number
# phone.extension          # returns extension provided with phone
# phone.full_e164          # returns e164 phone representation with extension
# phone.full_international # returns formatted international number with extension
# You can pass false to national and international methods in order to get unformatted representaions
#
# phone.international(false) # returns unformatted international phone
# phone.national(false)      # returns unformatted national phone
# You can get E164 formatted number
#
# phone.e164 # returns number in E164 format
# There is a to_s method, it will return e164 in case number is valid and original otherwise
#
# phone.to_s # returns number in E164 format if number is valid or original otherwise
# There is extended data available for numbers. It will return nil in case there is no data or phone is impossible. Can return array of values in case there are some results for specified number
#
# phone.geo_name # returns geo name of parsed phone
# phone.timezone # returns timezone name of parsed phone
# phone.carrier  # returns carrier name of parsed phone
# Phone class has following attributes
#
# phone.original        # string that was passed as phone number
# phone.sanitized       # sanitized phone number (only digits left)
# How it works
# Gem includes data from Google libphonenumber which has regex patterns for validations. Valid patterns are more specific to phone type and country. Possible patterns as usual are patterns with number of digits in number.
