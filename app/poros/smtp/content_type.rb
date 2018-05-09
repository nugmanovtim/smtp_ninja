module Smtp
  class ContentType
    def initialize(value, boundary: nil, name: nil)
      @value = value
      @boundary = boundary
      @name = name
    end
    HTML = 'text/html'.freeze
    MULTIPART_MIXED = 'multipart/mixed'.freeze

    def as_header
      @header ||= HeaderWithParams.new(Header::CONTENT_TYPE,
                                       @value, boundary: @boundary, name: @name)
    end
  end
end
