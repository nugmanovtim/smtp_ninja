module Smtp
  class ContentType
    def initialize(value)
      @value = value
    end
    HTML = ContentType.new('text/html')

    def as_header
      @header ||= Header.new(Header::CONTENT_TYPE, @value)
    end
  end
end
