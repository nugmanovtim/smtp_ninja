module Smtp
  class GenericHeader < String
    def initialize(value)
      super "#{value}\n"
    end

    NEW_LINE_HEADER = GenericHeader.new('')
  end
end
