module Smtp
  class EmailAddress < String

    REGEX = /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    def initialize(value)
      @value = value
      super @value
    end
  end
end
