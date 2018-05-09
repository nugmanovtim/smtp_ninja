module Smtp
  class FromHeader < Header
    def initialize(from)
      @from = from
      super Header::FROM, "<#{@from}>"
    end
  end
end
