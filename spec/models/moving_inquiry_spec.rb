require 'rails_helper'

RSpec.describe MovingInquiry, type: :model do
  before(:all) do
   @inquiry = build(:moving_inquiry)
  end

  context "request type" do
    it "should not have is_moving_request set nil" do
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
    end
    it "should not have the CN country code" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.invalid_for_country? 'CN').to be_truthy
    end
    it "should be a valid phone number" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.valid?).to be_truthy
    end
    it "should have the right country_code prefix" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.country_code).to be_in(%w[41])
    end
    it "should be a fixed or mobile number" do
      phone = Phonelib.parse(@inquiry.client_mobile)
      expect(phone.type).to be_in([:fixed_line, :mobile, :fixed_or_mobile])
    end
  end
  # xit "is not valid without a description"
  # xit "is not valid without a start_date"
  # xit "is not valid without a end_date"
end
