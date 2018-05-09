module Smtp
  class EmailAddress < String
    def initialize(value)
      super value
      validate
    end

    private

    def validate
      #raise InvalidEmail
    end
  end
end
