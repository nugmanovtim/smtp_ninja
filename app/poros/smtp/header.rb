module Smtp
  class Header < String
    TO = 'To'.freeze
    FROM = 'From'.freeze
    CONTENT_TYPE = 'Content-type'.freeze
    MIME_VERSION = 'MIME-Version'.freeze
    SUBJECT = 'Subject'.freeze
    def initialize(key, value)
      super "#{key}: #{value}\n"
    end
  end
end
