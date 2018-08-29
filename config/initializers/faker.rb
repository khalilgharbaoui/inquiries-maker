# frozen_string_literal: true

module SwissLocals
  class SwissLocals < Faker::Base
    class << self
      def locale
        fetch('locales.locale')
      end

      def random_salutations
        salut = ['salutations.de', 'salutations.en', 'salutations.fr'].sample
        fetch(salut)
      end

      def salutations(locale)
        raise ArgumentError, '⚠️ Invalid argument! choices: "de" or "en" or "fr"' unless %w[de en fr].any? { |word| word == locale.downcase }
        l = 'salutations.' + locale.to_s
        fetch(l)
      end
    end
  end
end
Faker.prepend SwissLocals
