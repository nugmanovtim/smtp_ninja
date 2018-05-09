module Smtp
  class Headers < Array
    def initialize(*headers)
      super headers.flatten
    end

    def to_s
      join('')
    end
  end
end
