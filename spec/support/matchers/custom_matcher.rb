# Drop this into /spec/support/matchers
# Usage: result.should be_url
# Passes if result is a valid url, returns error "expected result to be url" if not.

# Matcher to see if a string is a URL or not.
RSpec::Matchers.define :parse_to_http_url do |expected|
	# The match method, returns true if valie, false if not.
	match do |actual|
		# Use the URI library to parse the string, returning false if this fails.
		uri = URI.parse(actual)
		expect(uri.scheme).not_to be_nil
		expect(uri.scheme).to start_with("http")
	end
end

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
