require 'rails_helper'

RSpec.describe MovingInquiry, type: :model do
  before(:all) do
   @inquiry = build(:moving_inquiry)
  end

  context "request type" do
    it "should not have is_moving_request set to nil" do
      expect(@inquiry.is_moving_request).to_not be_nil
    end
    it "should have is_moving_request set to true" do
      expect(@inquiry.is_moving_request).to be_truthy
    end
    it "should not have is_moving_request set to false" do
      expect(@inquiry.is_moving_request).to_not be_falsy
    end
    it "is not valid without is_moving_request" do
      inquiry2 = build(:moving_inquiry, is_moving_request: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when is_moving_request with set to false" do
      inquiry2 = build(:moving_inquiry, is_moving_request: false)
      expect(inquiry2).to_not be_valid
    end
    it "should not have is_cleaning_request set nil" do
      expect(@inquiry.is_cleaning_request).to_not be_nil
    end
    it "should have is_cleaning_request set to false" do
      expect(@inquiry.is_cleaning_request).to be_falsy
    end
    it "should not have is_cleaning_request set to true" do
      expect(@inquiry.is_cleaning_request).to_not be_truthy
    end
    it "is not valid without is_cleaning_request" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when is_cleaning_request with set to true" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: true)
      expect(inquiry2).to_not be_valid
    end
    it "is_cleaning_request & is_moving_request should both be booleans" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: "string",is_moving_request: "😇")
      expect(inquiry2).to_not be_valid
    end
    it "is_cleaning_request = false & is_moving_request = true" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: false , is_moving_request: true)
      expect(inquiry2).to be_valid
    end
    it "is_cleaning_request = true & is_moving_request = false" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: true, is_moving_request: false)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid is_cleaning_request & is_moving_request are both true" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: true, is_moving_request: true)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid is_cleaning_request & is_moving_request are both false" do
      inquiry2 = build(:moving_inquiry, is_cleaning_request: false, is_moving_request: false)
      expect(inquiry2).to_not be_valid
    end
  end

  context "client_salutation" do
    it "is within ['Mr','Mrs','Herr','Frau','M.','Mme']" do
      expect(@inquiry.client_salutation).to be_in(%w[Mr Mrs Herr Frau M. Mme])
    end
    it "is not valid without a client_salutation" do
      inquiry2 = build(:moving_inquiry, client_salutation: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not integers" do
      inquiry2 = build(:moving_inquiry, client_salutation: 1)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not bools" do
      inquiry2 = build(:moving_inquiry, client_salutation: false)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not arrays" do
      inquiry2 = build(:moving_inquiry, client_salutation: ["Herr"])
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not arrays with hashes" do
      inquiry2 = build(:moving_inquiry, client_salutation:[{}])
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts Mr, Mrs, Herr, Frau, M., Mme" do
      inquiry2 = build(:moving_inquiry, client_salutation: "Meneer")
      expect(inquiry2).to_not be_valid
    end
  end

  context "locale" do
    it "is within ['de','en','fr]" do
      expect(@inquiry.locale).to be_in(%w[de en fr])
    end
    it "is not valid without a locale" do
      inquiry2 = build(:moving_inquiry, locale: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not integers" do
      inquiry2 = build(:moving_inquiry, locale: 1)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not bools" do
      inquiry2 = build(:moving_inquiry, locale: false)
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not arrays" do
      inquiry2 = build(:moving_inquiry, locale: ["de"])
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts strings not arrays with hashes" do
      inquiry2 = build(:moving_inquiry, locale:[{}])
      expect(inquiry2).to_not be_valid
    end
    it "is only accepts de, en, fr" do
      inquiry2 = build(:moving_inquiry, locale: "nl")
      expect(inquiry2).to_not be_valid
    end
  end

  context "client_first_name & client_last_name" do
    it "is valid when filled with strings" do
      expect(@inquiry.client_first_name.class && @inquiry.client_last_name.class).to equal(String)
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, client_first_name: "  ", client_last_name: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, client_first_name: nil, client_last_name: nil)
      expect(inquiry2).to_not be_valid
    end
  end

  context "client_email" do
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, client_email: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, client_email: nil)
      expect(inquiry2).to_not be_valid
    end
    it "should be a valid formated email adress" do
       client_email = ValidEmail2::Address.new(@inquiry.client_email)
      expect(client_email.valid?).to be_truthy
    end
    it "should not be a unvalidly formated email adress" do
       client_email = ValidEmail2::Address.new("😎@😌.com")
      expect(client_email.valid?).to be_falsy
    end
    it "should have a valid mx" do
      client_email = ValidEmail2::Address.new(@inquiry.client_email)
      expect(client_email.valid_mx?).to be_truthy
    end
    it "should not be subaddressed" do
      client_email = ValidEmail2::Address.new(@inquiry.client_email)
      expect(client_email.subaddressed?).to be_falsy
    end
    it "should not be disposable" do
      client_email = ValidEmail2::Address.new(@inquiry.client_email)
      expect(client_email.disposable?).to be_falsy
    end
    it "should really not be disposable" do
      inquiry2 = build(:moving_inquiry, client_email: "dick@75hosting.com")
      expect(inquiry2).to_not be_valid
    end
    it "can be subadressed" do
      inquiry2 = build(:moving_inquiry, client_email: "t.r.a.i+n.i.n.g@eduk8.me")
      expect(inquiry2).to be_valid
    end
    it "is of class <ValidEmail2::Address> if passed to it" do
      client_email = ValidEmail2::Address.new(@inquiry.client_email)
      expect(client_email.class).to equal(ValidEmail2::Address)
    end
    it "should be of class <String> if used trough default ways" do
      inquiry2_email = build(:moving_inquiry).client_email
      expect(inquiry2_email.class).to_not equal(ValidEmail2::Address)
      expect(inquiry2_email.class).to equal(String)
    end
  end

  context "client_mobile" do
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, client_mobile: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is not be valid when nil" do
      inquiry2 = build(:moving_inquiry, client_mobile: nil)
      expect(inquiry2).to_not be_valid
    end
    it "should have the right country code" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.valid_for_country? 'CH').to be_truthy
      # p phone
    end
    it "should not have the CN country code" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.invalid_for_country? 'CN').to be_truthy
    end
    it "validates the phone country code with custom validator" do
      expect(@inquiry).to validate_with(PhoneCountryCodeValidator).with_exact_options(fields: [:client_mobile], country_codes: ["CH", :ch, Phonelib.default_country])
    end
    it "should not validate the phone country code with custom validator when options are wrong" do
      expect(@inquiry).to_not validate_with(PhoneCountryCodeValidator).with_exact_options(fields: [:client_mobile], country_codes: ["CN", :cn, Phonelib.default_country])
    end
    it "should not validate with custom validator when options are missing" do
      expect(@inquiry).to_not validate_with(PhoneCountryCodeValidator).with_exact_options(fields:[],country_codes:["CH", :ch, Phonelib.default_country])
    end
    it "should be a valid phone number" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.valid?).to be_truthy
    end
    it "should have the '41' country_code prefix" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.country_code).to be_in(%w[41])
    end
    it "should be a fixed or mobile number" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.type).to be_in([:fixed_line, :mobile, :fixed_or_mobile])
    end

    it "can take a pager" do
      pager_number = '+41740000000'
      iquery2 = build(:moving_inquiry, client_mobile: pager_number)
      phone = Phonelib.parse(iquery2.client_mobile)
      expect(phone.type).to be_in([:pager])
    end

    it "test fixtures is not a pager" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.type).to_not be_in([:pager])
    end

  end

  context "client_postal_code" do
    it "is valid when filled with strings" do
      expect(@inquiry.client_postal_code.class).to equal(String)
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, client_postal_code: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, client_postal_code: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is valid with 4 numbers" do
      inquiry2 = build(:moving_inquiry)
      expect(inquiry2.client_postal_code.size).to equal(4)
    end
    it "is between 1xxx and 9xxx" do
      expect(@inquiry.client_postal_code.to_i).to be_between(1000, 9999)
    end
    it 'it is a valid CH zipcode' do
     expect(ValidatesZipcode.valid?(@inquiry.client_postal_code, 'CH')).to be_truthy
   end
    it 'it shoulde not have an invalid zipcode' do
     expect(ValidatesZipcode.valid?(@inquiry.client_postal_code, 'CN')).to be_falsy
   end
   it 'its error messages should be "Zipcode is invalid" when NOT valid' do
     # Arrange
     # stub / mock / build
     inquiry2 = build(:moving_inquiry, client_postal_code: '33333')
     # Act
     # do something with the method under test
     inquiry2.valid?
     # Assert
     # assert…. test.. test.
     expect(inquiry2.errors.messages[:client_postal_code]).to include 'Zipcode is invalid'
   end
   it 'its error messages should be empty when valid' do
     # Arrange
     # stub / mock / build
     inquiry2 = build(:moving_inquiry, client_postal_code: '3000')
     # Act
     # do something with the method under test
     inquiry2.valid?
     # Assert
     # assert…. test.. test.
     expect(inquiry2.errors.messages[:client_postal_code]).to_not include 'Zipcode is invalid'
     expect(inquiry2.errors.messages[:client_postal_code]).to be_empty
   end
  end
  context "client_property_size" do
    it `is within ["size_1", "size_2", "size_3", "size_4", "size_5", "size_6", "size_7", "size_8"]` do
      expect(@inquiry.client_property_size).to be_in(%w[size_1 size_2 size_3 size_4 size_5 size_6 size_7 size_8])
    end
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, client_property_size: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, client_property_size: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is valid when filled with strings" do
      expect(@inquiry.client_property_size.class).to equal(String)
    end
    it "is valid when in right size" do
      inquiry2 = build(:moving_inquiry, client_property_size: "size_8")
      expect(inquiry2).to be_valid
    end
  end
  context "client_city" do
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, client_city: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, client_city: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is valid when filled with strings" do
      expect(@inquiry.client_city.class).to equal(String)
    end
  end

  context "moving_postal_code" do
    it "is valid when filled with strings" do
      expect(@inquiry.moving_postal_code.class).to equal(String)
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, moving_postal_code: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, moving_postal_code: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is valid with 4 numbers" do
      inquiry2 = build(:moving_inquiry)
      expect(inquiry2.moving_postal_code.size).to equal(4)
    end
    it "is between 1xxx and 9xxx" do
      expect(@inquiry.moving_postal_code.to_i).to be_between(1000, 9999)
    end
    it 'it is a valid CH zipcode' do
     expect(ValidatesZipcode.valid?(@inquiry.moving_postal_code, 'CH')).to be_truthy
   end
    it 'it shoulde not have an invalid zipcode' do
     expect(ValidatesZipcode.valid?(@inquiry.moving_postal_code, 'CN')).to be_falsy
   end
   it 'its error messages should be "Zipcode is invalid" when NOT valid' do
     # Arrange
     # stub / mock / build
     inquiry2 = build(:moving_inquiry, moving_postal_code: '33333')
     # Act
     # do something with the method under test
     inquiry2.valid?
     # Assert
     # assert…. test.. test.
     expect(inquiry2.errors.messages[:moving_postal_code]).to include 'Zipcode is invalid'
   end
   it 'its error messages should be empty when valid' do
     # Arrange
     # stub / mock / build
     inquiry2 = build(:moving_inquiry, moving_postal_code: '3000')
     # Act
     # do something with the method under test
     inquiry2.valid?
     # Assert
     # assert…. test.. test.
     expect(inquiry2.errors.messages[:moving_postal_code]).to_not include 'Zipcode is invalid'
     expect(inquiry2.errors.messages[:moving_postal_code]).to be_empty
   end
  end

  context "moving_city" do
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, moving_city: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, moving_city: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is valid when filled with strings" do
      expect(@inquiry.moving_city.class).to equal(String)
    end
  end
  context "moving_date" do
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, moving_date: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, moving_date: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is valid when filled with a string" do
      expect(@inquiry.moving_date.class).to equal(Date)
    end
    it "is format iso8601" do
      expect(@inquiry.moving_date.to_formatted_s(:iso8601)).to be_truthy
      expect(@inquiry.moving_date.to_formatted_s(:db)).to be_truthy
    end
    it "is valid" do
      inquiry2 = build(:moving_inquiry, moving_date: '2017-10-10')
      expect(inquiry2).to be_valid
    end
  end

  context "client_street_and_number" do
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, client_street_and_number: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, client_street_and_number: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is valid when filled with a string" do
      expect(@inquiry.client_street_and_number.class).to equal(String)
    end
    it "it has to have a size greater than 2" do
      inquiry2 = build(:moving_inquiry)
      expect(inquiry2.client_street_and_number.size).to be > 2
    end
    it "it can not be valid with less than 3 in lenght" do
      inquiry2 = build(:moving_inquiry, client_street_and_number: "a3")
      expect(inquiry2).to_not be_valid
    end
    it "it is valid with 2 charachter or more" do
      inquiry2 = build(:moving_inquiry, client_street_and_number: "abc 4")
      expect(inquiry2).to be_valid
    end
    it "it has some digits in it" do
      expect(@inquiry.client_street_and_number).to have_digits
    end
    it "it validated that it contains numbers" do
      inquiry2 = build(:moving_inquiry, client_street_and_number: "onlylettersstreet")
      expect(inquiry2).to_not be_valid
    end
  end
  context "moving_street_and_number" do
    it "is not valid when nil" do
      inquiry2 = build(:moving_inquiry, moving_street_and_number: nil)
      expect(inquiry2).to_not be_valid
    end
    it "is not valid when empty" do
      inquiry2 = build(:moving_inquiry, moving_street_and_number: "  ")
      expect(inquiry2).to_not be_valid
    end
    it "is valid when filled with a string" do
      expect(@inquiry.moving_street_and_number.class).to equal(String)
    end
    it "it has to have a size greater than 2" do
      inquiry2 = build(:moving_inquiry)
      expect(inquiry2.moving_street_and_number.size).to be > 2
    end
    it "it can not be valid with less than 3 in lenght" do
      inquiry2 = build(:moving_inquiry, moving_street_and_number: "a3")
      expect(inquiry2).to_not be_valid
    end
    it "it is valid with 3 charachter or more" do
      inquiry2 = build(:moving_inquiry, moving_street_and_number: "abc 4")
      expect(inquiry2).to be_valid
    end
    it "it has some digits in it" do
      expect(@inquiry.moving_street_and_number).to have_digits
    end
    it "it validates that it contains numbers" do
      inquiry2 = build(:moving_inquiry, moving_street_and_number: "onlylettersstreet")
      expect(inquiry2).to_not be_valid
    end
  end
end
