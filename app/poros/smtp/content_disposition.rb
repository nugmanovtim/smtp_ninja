module Smtp
  class ContentDisposition
    ATTACHMENT = 'attachment'.freeze
    def initialize(type, filename)
      @type = type
      @filename = filename
    end

    def as_header
      @header ||= HeaderWithParams.new(Header::CONTENT_DISPOSITION, @type,
                                       filename: @filename)
    end
  end
end
