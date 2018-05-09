module Smtp
  class EmailAddresses < Array
    def initialize(addresses)
      super addresses.split(', ').map { |e| EmailAddress.new(e) }
    end
  end
end
