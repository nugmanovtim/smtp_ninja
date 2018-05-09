module Smtp
  class ToHeaders < Array
    def initialize(to)
      @to = [to].flatten
      super @to.map { |email_address| ToHeader.new(email_address) }
    end
  end
end
