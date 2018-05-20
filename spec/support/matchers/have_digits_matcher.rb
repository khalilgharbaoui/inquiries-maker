RSpec::Matchers.define :have_digits do |expected|
	match do |actual|
		def has_digits?(str)
  		str.count("0-9") > 0 && str.match(/\d+/)
		end
		expect(actual).to_not be_nil
		expect(actual.class).to equal(String)
		expect(has_digits?(actual)).not_to be_nil
		expect(has_digits?(actual)).not_to be_falsy
	end
end
