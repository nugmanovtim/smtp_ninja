module Smtp
  class Subject
    def initialize(value)
      @value = value
    end

    def as_header
      @header ||= Header.new(Header::SUBJECT, @value)
    end
  end
end
