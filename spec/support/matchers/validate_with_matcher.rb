
# RSpec matcher for validates_with.
# https://gist.github.com/2032846
# Usage:
#
#     describe User do
#       it { should validate_with CustomValidator }
#     end
#
#     describe User do
#       it do
#         should validate_with(CustomValidator)
#           .with_options(foo: 'foo', bar: 'bar')
#     end
RSpec::Matchers.define :validate_with do |expected_validator_class, options|
  match do |subject|
    # allow Class to call same Validator multiple times w/ different options
    @matching_validators = subject.class.validators.select do |validator|
      validator.class == expected_validator_class
    end
    @matching_validators.present? && options_matching?
  end

  chain :with_exact_options do |options|
    @options = options
  end

  description do
    'validates_with'
  end

  failure_message do |text|
    "expected to validate with #{expected_validator_class}" + options_failure_message
  end

  failure_message_when_negated do |text|
    "expected to not validate with #{expected_validator_class}" + options_failure_message
  end

  private

  def options_matching?
    if @options.present?
      @matching_validators.any? do |validator|
        @options.all? { |key, value| validator.options[key] == value }
      end
    else
      true
    end
  end

  # TODO - add ", instead received options: #{actual_options}" to message
  #   - how should it output multiple matching validators?
  def options_failure_message
    return '' unless @matching_validators.present? && @options.present?

    " with options: #{@options}"
  end
end
