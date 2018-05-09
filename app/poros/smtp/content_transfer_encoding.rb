module Smtp
  class ContentTransferEncoding
    EIGHT_BIT = '8bit'.freeze
    BASE_64 = 'base64'.freeze
    def initialize(value)
      @value = value
    end

    def as_header
      @header ||= Header.new(Header::CONTENT_TRANSFER_ENCODING, @value)
    end
  end
end
