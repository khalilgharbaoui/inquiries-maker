module SwissLocals
  class SwissLocals < Faker::Base
    class << self
      def locale
        fetch('locales.locale')
      end
    end
  end
end
Faker.prepend SwissLocals
