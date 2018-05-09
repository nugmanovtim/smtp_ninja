module Smtp
  class ToHeader < Header
    def initialize(to)
      @to = to
      super Header::TO, "<#{@to}>"
    end
  end
end
