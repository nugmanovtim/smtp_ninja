module Smtp
  class Message < String
    attr_reader :content_type
    def initialize(value, content_type = ContentType::HTML)
      super value
      @content_type = content_type
    end
  end
end
