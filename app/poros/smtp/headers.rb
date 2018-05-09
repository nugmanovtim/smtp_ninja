module Smtp
  class Headers
    def initialize(*headers)
      @headers = headers
      puts to_s
    end

    def to_s
      @headers.join('') + "\n"
    end
  end
end
